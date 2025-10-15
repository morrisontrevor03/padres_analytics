{{ config(
    materialized='table'
)}}

SELECT
    player_name,
    coalesce(position, 'Unknown') AS position,
    SUM(plate_appearances) AS career_plate_apperances,
    SUM(at_bats) AS career_at_bats,
    SUM(hits) AS career_hits,
    SUM(home_runs) AS career_home_runs,
    SUM(rbi) AS career_rbi,
    SAFE_DIVIDE(SUM(hits), SUM(at_bats)) AS career_batting_avg,
    SAFE_DIVIDE(SUM(total_bases), SUM(plate_appearances)) as career_ops,
    SUM(total_bases) AS career_total_bases,
FROM {{ref('stg_batting_stats')}}
WHERE
    season_year >= 1969 and season_year < 2100
GROUP BY
    player_name, position
{{ config(
    materialized='table', 
    unique_key=['player_id', 'season_year']
)}}

SELECT
    player_id,
    season_year,
    player_name,
    coalesce(position, 'Unknown') AS position,
    plate_appearances,
    at_bats,
    hits,
    home_runs,
    rbi,
    batting_avg,
    obp,
    slg,
    ops,
    ops_plus,
    total_bases,
FROM {{ref('stg_batting_stats')}}
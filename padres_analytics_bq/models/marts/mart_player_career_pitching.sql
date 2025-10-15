{{ config(
    materialized='table', 
    unique_key=['player_id', 'season_year']
)}}

SELECT
    player_name,
    SAFE_DIVIDE((SUM(earned_runs) * 9), SUM(innings_pitched)) AS career_era,
    SUM(shutouts) AS career_shutouts,
    SUM(saves) AS career_saves,
    SUM(innings_pitched) AS career_innings_pitched,
    SUM(hits_allowed) AS career_hits_allowed,
    SUM(runs_allowed) AS career_runs_allowed,
    SUM(earned_runs) AS career_earned_runs,
    SUM(home_runs_allowed) AS career_home_runs_allowed,
    SUM(walks_allowed) AS career_walks_allowed,
    SUM(intentional_walks_allowed) AS career_intentional_walks_allowed,
    SUM(strikeouts) AS career_strikeouts,
    SUM(hit_by_pitch) AS career_hit_by_pitch,
    SUM(balks) AS career_balks,
    SUM(wild_pitches) AS career_wild_pitches,
    SUM(batters_faced) AS career_batters_faced,
    SAFE_DIVIDE((13*SUM(home_runs_allowed))+(3*(SUM(walks_allowed)+SUM(hit_by_pitch)))-(2*SUM(strikeouts)),(SUM(innings_pitched)+3.1)) AS career_fielding_independent_pitching,
    SAFE_DIVIDE((SUM(walks_allowed)+SUM(hits_allowed)), SUM(innings_pitched)) AS career_walks_hits_per_inning_pitched,
    SAFE_DIVIDE(SUM(hits_allowed) * 9, SUM(innings_pitched)) AS career_hits_per_nine_innings,
    SAFE_DIVIDE(SUM(home_runs_allowed) * 9, SUM(innings_pitched)) AS career_homeruns_per_nine_innings,
    SAFE_DIVIDE(SUM(walks_allowed) * 9, SUM(innings_pitched)) AS career_walks_per_nine_innings,
    SAFE_DIVIDE(SUM(strikeouts) * 9, SUM(innings_pitched)) AS career_strikeouts_per_nine_innings,
    SAFE_DIVIDE(SUM(strikeouts), SUM(walks_allowed)) AS career_strikeout_walk_ratio
FROM {{ref('stg_pitching_stats')}}
WHERE
    season_year >= 1969 and season_year < 2100
GROUP BY
    player_name
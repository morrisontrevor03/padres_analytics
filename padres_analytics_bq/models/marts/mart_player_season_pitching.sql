{{ config(
    materialized='table', 
    unique_key=['player_id', 'season_year']
)}}

SELECT
    player_id,
    season_year,
    player_name,
    earned_runs_average,
    shutouts,
    saves,
    innings_pitched,
    hits_allowed,
    runs_allowed,
    earned_runs,
    home_runs_allowed,
    walks_allowed,
    intentional_walks_allowed,
    strikeouts,
    hit_by_pitch,
    balks,
    wild_pitches,
    batters_faced,
    fielding_independent_pitching,
    walks_hits_per_inning_pitched,
    hits_per_nine_innings,
    homeruns_per_nine_innings,
    walks_per_nine_innings,
    strikeouts_per_nine_innings,
    strikeout_walk_ratio
FROM {{ref('stg_pitching_stats')}}
WHERE
    season_year >= 1969 and season_year < 2100

{{ config(
    materialized='table'
)}}

SELECT 
    season_year,
    rank,
    games_played,
    wins,
    losses,
    runs_scored,
    division_win
FROM {{ref('stg_games')}}
WHERE
    season_year >= 1969 and season_year < 2100
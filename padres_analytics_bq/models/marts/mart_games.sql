{{ config(
    materialized='table'
)}}

SELECT 
    year_id,
    rank,
    games_played,
    wins,
    losses,
    runs_scored,
    division_win
FROM {{ref('stg_games')}}
WHERE
    year_id >= 1963 and year_id < 2100
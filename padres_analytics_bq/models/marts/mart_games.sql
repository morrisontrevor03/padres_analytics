{{ config(
    materialized='table'
)}}

WITH season AS (
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
),

era AS (
    SELECT
        season_year,
        SAFE_DIVIDE(SUM(earned_runs)*9.0, NULLIF(SUM(innings_pitched),0)) AS team_era
    FROM {{ ref('mart_player_season_pitching')}}
    GROUP BY 
        season_year
),

bat_avg AS (
    SELECT
        season_year,
        SAFE_DIVIDE(SUM(hits), NULLIF(SUM(at_bats),0)) AS team_avg
    FROM {{ ref('mart_player_season_batting')}}
    GROUP BY
        season_year
)

SELECT
    season.season_year,
    season.rank,
    season.games_played,
    season.wins,
    season.losses,
    season.runs_scored,
    season.division_win,
    era.team_era,
    bat_avg.team_avg
FROM season
LEFT JOIN bat_avg USING (season_year)
LEFT JOIN era USING (season_year)
{{config(materialized='view')}}

SELECT
    yearId as season_year,
    Rank as rank,
    G as games_played,
    W as wins,
    L as losses,
    R as runs_scored,
    COALESCE(DivWin, false) as division_win
FROM {{source('padres_raw', 'team')}}
WHERE
    teamID = 'SDN' OR franchID = 'SDP'
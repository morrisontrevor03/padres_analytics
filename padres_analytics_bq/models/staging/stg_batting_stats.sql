{{config(materialized='view')}}

SELECT
    TO_HEX(SHA256(CONCAT(Name, '-', CAST(Year AS STRING)))) AS player_id,
    SAFE_CAST(Year as INT64) AS season_year,
    UPPER(TRIM(Name)) AS player_name,
    UPPER(TRIM(Position)) AS position,
    SAFE_CAST(Age as INT64) AS age,
    SAFE_CAST(Games as INT64) AS games,
    SAFE_CAST(Plate_Appearances as INT64) AS plate_appearances,
    SAFE_CAST(At_Bats AS INT64) AS at_bats,
    SAFE_CAST(Hits AS INT64) AS hits,
    SAFE_CAST(Home_Runs AS INT64) AS home_runs,
    SAFE_CAST(Runs_Batted_In AS INT64) AS rbi,
    SAFE_CAST(Batting_Average AS FLOAT64) AS batting_avg,
    SAFE_CAST(On_Base_Percentage AS FLOAT64) AS obp,
    SAFE_CAST(Slugging_Percentage AS FLOAT64) AS slg,
    SAFE_CAST(On_Base_Plus_Slugging_Percentage AS FLOAT64) AS ops,
    SAFE_CAST(On_Base_Plus_Slugging_Percentage_Plus AS INT64) AS ops_plus,
    SAFE_CAST(Total_Bases AS INT64) AS total_bases,
    Dominant_Hand AS batting_hand,
    Switch_Hitter
FROM {{source('padres_raw','batting')}}
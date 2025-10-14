{{ config(materialized='table')}}

SELECT
    player_id,
    player_name,
    position,
    dominant_hand,
    switch_hitter
FROM
    {{ref('stg_pitching_stats')}}

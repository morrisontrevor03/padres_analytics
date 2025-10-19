### Padres Analytics Data Pipeline

## Overview

The goal of this project is to take data from multiple sources and make it available for answering key business questions and creating vizualisations. The data provides a wealth of information pertaining to the San Diego Padres from 1969-2023. The data focuses on more of a macro view of the health of the team, allowing for analysis of trends throughout their history rather than focusing on individual games or innings. 

## Vizualizations
https://public.tableau.com/app/profile/trevor.morrison/viz/PadresAnalytics/CorrelationAnalysis?publish=yes
https://public.tableau.com/app/profile/trevor.morrison/viz/PadresAnalytics/HistoricalData?publish=yes

## Data Sources
Padres pitching and batting data: https://www.kaggle.com/datasets/mattop/san-diego-padres-batting-and-pitching-1969-2023
Big picture data (wins, losses, etc): https://www.kaggle.com/datasets/dalyas/lahman-baseball-database

## Tech Stack
- Warehouse: Google BigQuery
- Transformation: Data Build Tool (DBT)
- Exploratory Data Analysis: SQL in BigQuery
- Vizualization: Tableau (WIP)

## Potential Key Insights
- Who had the highest impact offensively in Padres history?
- How does the teams OBP correlate with a winning season?
- How important is team ERA when it comes to determining a winning season?
- How does pitching effectiveness compare with offensive abilities?

## Challenges
There are 85 column tests used to ensure data quality. Given that the data comes from the real world, and the real world can be messy, here are some challenges that I faced in handling this data.
- There was a player strike in the 1994 season, resulting in no division winner. In the raw data, the value in the 'Division_Winner' column was null, where True or False is expected. In this case, I found that the best work around was to default the value to False, since there was no division winner at all. This is not the ideal option, but this is a rare situation and does not alter their historical average division win rate very much.
- Some of the calculated stats, such is batting average, were miscalculated in the raw data. For example, one pitchers ERA was 1200. I recalculated these stats in the staging step and used testing to ensure that the values were within reasonable bounds.
- Some stats can be skewed if there is a low enough sample size. For example, in ERA, there can be some exceptionally low ERAs if the pitcher in question only pitched an inning or two. However, this doesn't provide meaningful insight. For analysis, I mainly looked at pitchers who have pitched at least 100 innings to draw any meaningful insight on their performance. 

## Next steps
- In the raw data, some players are missing a 'position' attribute. I will need to collect this data from another source and add it to the players who do not currently have a position. 
- Training an ML model to predict win totals per season. This model can then be used to demonstrate which features matter the most in determining how much the Padres win.

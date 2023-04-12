-- Explore the table
SELECT 
  * 
FROM 
  [dbo].[WorldCupMatches];

-- Wanted to exclude duplicates for better credibility
-- Find Duplicates
SELECT 
  [Year], 
  [Date], 
  [Time], 
  [Round], 
  [Stadium], 
  [City], 
  [Country], 
  [HomeTeam], 
  [HomeGoals], 
  [AwayTeam], 
  [AwayGoals], 
  [Observation] 
FROM 
  [dbo].[WorldCupMatches] 
GROUP BY 
  [Year], 
  [Date], 
  [Time], 
  [Round], 
  [Stadium], 
  [City], 
  [Country], 
  [HomeTeam], 
  [HomeGoals], 
  [AwayTeam], 
  [AwayGoals], 
  [Observation] 
HAVING 
  COUNT(*)> 1;

-- Remove Duplicates
DELETE T 
FROM 
  (
    SELECT 
      *, 
      DupRank = ROW_NUMBER() OVER (
        PARTITION BY 
        [Year], 
        [Date], 
        [Time], 
        [Round], 
        [Stadium], 
        [City], 
        [Country], 
        [HomeTeam], 
        [HomeGoals], 
        [AwayTeam], 
        [AwayGoals], 
        [Observation] 
        ORDER BY 
          (
            SELECT 
              NULL
          )
      ) 
    FROM 
      [dbo].[WorldCupMatches]
  ) AS T 
WHERE 
  DupRank > 1;

-- I need to transform the table in order to have a column with unique teams with goals and not columns with home or away teams only.
-- I want these transformations in order to make calculations to answer the questions.
-- First i changed the order of appearance and union the table.
-- Then I used CTE to make code more readable and reusable.
-- Lastly I created a view with the CTE to be my primary table for the queries.
CREATE VIEW TableauFormat AS WITH TableauFormat AS (
  SELECT 
    [Year], 
    [Date], 
    [Time], 
    [Round], 
    [Stadium], 
    [City], 
    [Country], 
    [HomeTeam] AS Team, 
    [HomeGoals] AS 'Team G', 
    [AwayTeam] AS Opponent, 
    [AwayGoals] AS 'Opponent G', 
    [Observation] 
  FROM 
    [dbo].[WorldCupMatches] 
  UNION 
  SELECT 
    [Year], 
    [Date], 
    [Time], 
    [Round], 
    [Stadium], 
    [City], 
    [Country], 
    [AwayTeam]Team2, 
    [AwayGoals]Goal2, 
    [HomeTeam]Team1, 
    [HomeGoals]Goal1, 
    [Observation] 
  FROM 
    [dbo].[WorldCupMatches]
) 
SELECT 
  * 
FROM 
  TableauFormat;

-- MAIN ANALYSIS --

-- Which countries have qualified to the World Cup and how many times:
SELECT 
  Team, 
  COUNT(Team) AS QTimes 
FROM 
  (
    SELECT 
      Team 
    FROM 
      TableauFormat 
    GROUP BY 
      Team, 
      Year
  ) AS q 
GROUP BY 
  Team 
ORDER BY 
  COUNT(Team) DESC;

-- Which teams has reached the Semi-Finals and how many times:
SELECT 
  Team, 
  COUNT(Team) AS SFtimes 
FROM 
  (
    SELECT 
      Team 
    FROM 
      TableauFormat 
    WHERE 
      Round IN ('Semi-finals') 
    GROUP BY 
      Team, 
      Year
  ) AS q 
GROUP BY 
  Team 
ORDER BY 
  COUNT(Team) DESC;
  
-- Which teams has reached the Final and how many times:
SELECT 
  Team, 
  COUNT(Team) AS Ftimes 
FROM 
  (
    SELECT 
      Team 
    FROM 
      TableauFormat 
    WHERE 
      Round IN ('Final') 
    GROUP BY 
      Team, 
      Year
  ) AS q 
GROUP BY 
  Team 
ORDER BY 
  COUNT(Team) DESC;

-- How many goals have scored every team in the history of World Cup:
SELECT 
  Team, 
  SUM([Team G]) AS Total_Goals 
FROM 
  TableauFormat 
GROUP BY 
  Team 
ORDER BY 
  SUM([Team G]) DESC;

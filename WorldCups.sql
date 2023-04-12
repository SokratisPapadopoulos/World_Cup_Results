-- Explore the table
SELECT 
  * 
FROM 
  [dbo].[WorldCups];

-- Which countries have won the World Cup and how many times:
SELECT 
  [Winner], 
  COUNT([Winner]) AS Total_Wins 
FROM 
  [dbo].[WorldCups] 
GROUP BY 
  [Winner] 
ORDER BY 
  COUNT([Winner]) DESC;
 
 -- Which countries have hosted the World Cup and how many times:
SELECT 
  [Country], 
  COUNT([Country]) AS Total_Hosts 
FROM 
  [dbo].[WorldCups] 
GROUP BY 
  [Country] 
ORDER BY 
  COUNT([Country]) DESC;

-- Total attendance by Country and Year:
SELECT 
  [Year], 
  [Country], 
  [Attendance] 
FROM 
  [dbo].[WorldCups] 
ORDER BY 
  [Attendance] DESC;
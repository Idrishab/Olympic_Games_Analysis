SELECT *
FROM OlympicGames.dbo.athletes_event_results
ORDER BY Games

SELECT COUNT (DISTINCT Team) AS Teams
FROM dbo.team_info

SELECT COUNT (DISTINCT NOC)
FROM OlympicGames.dbo.athletes_event_results

SELECT DISTINCT Games
FROM OlympicGames.dbo.athletes_event_results
ORDER BY Games

SELECT 
	ID,
	Name AS Competitor_Name, -- Renamed Column
	CASE
		WHEN Sex = 'M' THEN 'Male'
		ELSE 'Female'
	END AS Sex,
	Age,
	CASE
		WHEN Age < 18 THEN 'Under 18'
		WHEN Age BETWEEN 18 AND 25 THEN '18-25'
		WHEN Age BETWEEN 25 AND 30 THEN '25-30'
		WHEN Age > 30 THEN 'Over 30'
	END AS Age_Group,
	Height,
	Weight,
	NOC AS Nation_Code,
	LEFT (Games, CHARINDEX(' ', Games) -1) AS Year,
	RIGHT (Games, CHARINDEX(' ', REVERSE(Games)) -1) AS Season,
	City,
	Sport,
	Event,
	CASE
		WHEN Medal = 'NA' THEN 'Not Registered' 
		ELSE Medal
	END AS Medal
FROM [OlympicGames].[dbo].[athletes_event_results]
WHERE RIGHT (Games, CHARINDEX(' ', REVERSE(Games)) -1) = 'Summer'
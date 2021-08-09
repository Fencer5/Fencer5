USE BabyNames;

SELECT *
FROM baby_names_ranked$;
--Find the number one ranked girls name for each year
USE BabyNames;
SELECT DISTINCT Name, Year, Gender
FROM BabyNames.dbo.baby_names_ranked$
WHERE Name IS NOT NULL and
	Rank = 1 and
	Gender = 'F'
ORDER BY Year DESC

--Find the number one ranked boys0 name for each year
SELECT DISTINCT Name, Year, Gender
FROM BabyNames.dbo.baby_names_ranked$
WHERE Name IS NOT NULL and
	Rank = 1 and
	Gender = 'M'
ORDER BY Year DESC

--SHOWS THE TOP TEN BABY NAMES FOR EACH YEAR ALONG WITH HOW COMMON THE NAME WAS THAT YEAR IN HITS
USE BabyNames;
SELECT Name, Rank, Year, Gender, Hits
FROM BabyNames.dbo.baby_names_ranked$
WHERE Name IS NOT Null
AND Rank BETWEEN 1 AND 10
Order by year DESC, Rank;

USE BabyNames;
SELECT Name, COUNT(*) OVER (Partition by dbo.baby_names_ranked$.name ORDER BY Hits) as Hits
FROM baby_names_ranked$
WHERE Name IS NOT NULL


--See which baby names were used the most over the last 30 years
USE BabyNames;
SELECT DISTINCT Name, SUM(Hits) OVER (Partition by dbo.baby_names_ranked$.Name) as Frequency
FROM BabyNames.dbo.baby_names_ranked$
WHERE Name IS NOT NULL
Order by Frequency DESC

--Just boys names
SELECT DISTINCT NAME, SUM(Hits) OVER (Partition by dbo.baby_names_ranked$.Name) as Frequency
FROM BabyNames.dbo.baby_names_ranked$
WHERE Name IS NOT NULL
AND gender = 'M'
ORDER BY Frequency DESC;

--Just girls names
SELECT DISTINCT NAME, SUM(Hits) OVER (Partition by dbo.baby_names_ranked$.Name) as Frequency
FROM BabyNames.dbo.baby_names_ranked$
WHERE Name IS NOT NULL
AND gender = 'F'
ORDER BY Frequency DESC;

DROP VIEW if Exists BabyNames;
CREATE VIEW BabyNames 
AS
SELECT DISTINCT Name, Year, Gender
FROM BabyNames.dbo.baby_names_ranked$
WHERE Name IS NOT NULL and
	Rank = 1 and
	Gender = 'M'


SELECT *
FROM BabyNames


















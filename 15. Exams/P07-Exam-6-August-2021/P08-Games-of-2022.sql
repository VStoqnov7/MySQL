USE `games`;

SELECT g.`name`,
	`release_date`,
	CONCAT(SUBSTRING(g.`description`, 1, 10), '...') AS `summary`,
	CASE 
		WHEN MONTH(`release_date`) IN (1, 2, 3) THEN 'Q1'
		WHEN MONTH(`release_date`) IN (4, 5, 6) THEN 'Q2'
		WHEN MONTH(`release_date`) IN (7, 8, 9) THEN 'Q3'
		WHEN MONTH(`release_date`) IN (10, 11, 12) THEN 'Q4'
		END AS `quarter`,
	t.`name`
	FROM `games` AS g
	JOIN `teams` AS t
	ON g.`team_id` = t.`id`
	WHERE YEAR(`release_date`) = 2022 AND MONTH(`release_date`) % 2 = 0 AND g.`name` LIKE '%2'
	ORDER BY `quarter`;
        
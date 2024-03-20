USE `softuni_imdb`;

SELECT `title`,
	CASE
	WHEN `rating` <= 4 THEN 'poor'
	WHEN `rating` <= 7 THEN 'good'
	ELSE 'excellent'
	END AS `rating`,
	CASE 
	WHEN `has_subtitles` = 1 THEN 'english'
	ELSE '-' END AS `subtitles`,
	`budget`
	FROM `movies` AS m
	JOIN `movies_additional_info` AS mai
	ON m.`movie_info_id` = mai.`id`
	ORDER BY `budget` DESC;
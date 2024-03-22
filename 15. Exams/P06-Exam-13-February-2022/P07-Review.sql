USE `online_store`;

SELECT * 
	FROM `reviews`
	WHERE `content` LIKE 'My%' AND LENGTH(`content`) > 61
	ORDER BY `rating` DESC
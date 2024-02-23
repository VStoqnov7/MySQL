USE `soft_uni`;

SELECT `project_id` AS `id`, 
	`name`,
	`description`,
	DATE_FORMAT(`start_date`, '%Y-%m-%d %H:%i:%s') ,
	DATE_FORMAT(`end_date`, '%Y-%m-%d %H:%i:%s') 
	FROM `projects`
	ORDER BY `start_date`,
	`name`,
	`project_id`
	LIMIT 10;
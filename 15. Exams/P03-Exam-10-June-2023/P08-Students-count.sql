USE `universities_db`;

SELECT COUNT(c.`id`) AS `students_count`,
	u.`name` AS `university_name`
	FROM `universities` AS u
	JOIN `courses` AS c 
	ON u.`id` = c.`university_id`
	JOIN `students_courses` AS sc
	ON c.`id` = sc.`course_id`
	GROUP BY u.`name`
	HAVING students_count >= 8
	ORDER BY `students_count` DESC, u.`name` DESC;
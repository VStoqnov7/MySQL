USE `universities_db`;

SELECT CONCAT(`first_name`, ' ', `last_name`) AS `full_name`,
	SUBSTRING(`email`, 2, 10) AS `username`,
	REVERSE(`phone`) AS `password`
	FROM `students` AS s
	LEFT JOIN `students_courses` AS sc
	ON sc.`student_id` = s.`id`
	WHERE sc.`course_id` IS NULL
	ORDER BY `password` DESC;
        
USE `universities_db`;

DELIMITER $$
CREATE PROCEDURE udp_graduate_all_students_by_year(year_started INT)
BEGIN 
	UPDATE `students` AS s
	JOIN `students_courses` AS sc
	ON s.`id` = sc.`student_id`
	JOIN `courses` AS c
	ON sc.`course_id` = c.`id`
	SET `is_graduated` = 1
	WHERE YEAR(c.`start_date`) = year_started;
END$$

DELIMITER ;

CALL udp_graduate_all_students_by_year(2018);


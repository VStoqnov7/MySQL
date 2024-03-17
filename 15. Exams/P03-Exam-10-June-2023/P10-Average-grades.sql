USE `universities_db`;

DELIMITER $$
CREATE FUNCTION udf_average_alumni_grade_by_course_name(course_name VARCHAR(60))
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
	DECLARE `sum` DECIMAL(19,2);
	SET `sum` = (SELECT
	AVG(sc.`grade`)
	FROM `courses` AS c
	JOIN `students_courses` AS sc
	ON c.`id` = sc.`course_id`
	JOIN `students` AS s
	ON sc.`student_id` = s.`id`
	WHERE s.`is_graduated` = 1 AND c.`name` = course_name);
	RETURN `sum`;
END$$

DELIMITER ;

SELECT c.name, udf_average_alumni_grade_by_course_name('Quantum Physics') as average_alumni_grade 
	FROM courses c
	WHERE c.name = 'Quantum Physics';

SELECT c.name, udf_average_alumni_grade_by_course_name('Statistics') as average_alumni_grade FROM courses c
WHERE c.name = 'Statistics';

SELECT c.name, udf_average_alumni_grade_by_course_name('Web Development Advanced') as average_alumni_grade FROM courses c
WHERE c.name = 'Web Development Advanced';

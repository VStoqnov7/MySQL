USE `preserves_db`;

DELIMITER $$
CREATE FUNCTION udf_average_salary_by_position_name (name VARCHAR(40))
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
	RETURN(
		SELECT AVG(w.`salary`)
			FROM `positions` AS p
			JOIN `workers` AS w
			ON p.`id` = w.`position_id`
			GROUP BY p.`name`
			HAVING p.`name` = name
	);
END$$

DELIMITER ;

SELECT p.name, udf_average_salary_by_position_name('Forester') as position_average_salary FROM positions p 
WHERE p.name = 'Forester'




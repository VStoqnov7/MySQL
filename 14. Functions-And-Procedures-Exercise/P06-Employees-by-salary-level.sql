USE `soft_uni`;

DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(19, 4))
RETURNS VARCHAR(8)
DETERMINISTIC
BEGIN
	DECLARE salary_level VARCHAR(8);
	IF `salary` < 30000 THEN SET salary_level := 'Low';
	ELSEIF `salary` BETWEEN 30000 AND 50000 THEN SET salary_level := 'Average';
	ELSE SET salary_level := 'High';
	END IF;
	RETURN salary_level;
END$$  #Judge want here this ";" NOT THIS "$$"

DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(20))
BEGIN
	SELECT `first_name`, `last_name`
	FROM `employees`
	WHERE ufn_get_salary_level(salary) = salary_level
	ORDER BY first_name DESC, last_name DESC;
END$$  #Judge want here this ";" NOT THIS "$$"

DELIMITER ;

CALL usp_get_employees_by_salary_level('high');
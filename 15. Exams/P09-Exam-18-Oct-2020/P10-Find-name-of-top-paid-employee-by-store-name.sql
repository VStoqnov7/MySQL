USE `softuni`;

DELIMITER $$
CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50)) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE employee_info VARCHAR(255);

	SELECT CONCAT(
	e.`first_name`, ' ', 
		COALESCE(CONCAT(e.`middle_name`, '. '), ''), 
		e.`last_name`, ' works in store for ', 
		TIMESTAMPDIFF(YEAR, e.`hire_date`, '2020-10-18'), ' years'
	) INTO employee_info
	FROM `stores` AS s
	JOIN `employees` AS e 
	ON s.`id` = e.`store_id`
	WHERE s.`name` = store_name
	ORDER BY e.`salary` DESC
	LIMIT 1;

    RETURN employee_info;
END$$
USE `cars`;

DELIMITER $$
CREATE FUNCTION udf_courses_by_client (phone_num VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
RETURN(
	SELECT COUNT(co.`id`)
	FROM `courses` AS co
	JOIN `clients` AS c
	ON co.`client_id` = c.`id`
	WHERE c.`phone_number` = phone_num
);
END$$
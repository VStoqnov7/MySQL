USE `cars`;

DELIMITER $$
CREATE PROCEDURE udp_courses_by_address(address_name VARCHAR(100))
BEGIN 
	SELECT ad.`name`,
		c.`full_name`,
		CASE
			WHEN co.`bill` <= 20 THEN 'Low'
			WHEN co.`bill` <= 30 THEN 'Medium'
			ELSE 'High'
			END AS `level_of_bill`,
		ca.`make`,
		ca.`condition`,
		cat.`name` AS `cat_name`
		FROM `addresses` AS ad
		JOIN `courses` AS co
		ON ad.`id` = co.`from_address_id`
		JOIN `clients` AS c
		ON co.`client_id` = c.`id`
		JOIN `cars` AS ca
		ON co.`car_id` = ca.`id`
		JOIN `categories` AS cat
		ON ca.`category_id` = cat.`id`
		WHERE ad.`name` = address_name
		ORDER BY ca.`make`, c.`full_name`;
END$$

DELIMITER ;

CALL udp_courses_by_address('700 Monterey Avenue');
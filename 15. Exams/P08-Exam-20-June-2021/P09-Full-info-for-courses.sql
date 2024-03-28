USE `cars`;

SELECT ad.`name`,
	CASE
		WHEN HOUR(co.`start`) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
		END AS `day_time`,
	co.`bill`,
	c.`full_name`,
	ca.`make`,
	ca.`model`,
	cat.`name` AS `category_name`
	FROM `addresses` AS ad
	JOIN `courses` AS co
	ON ad.`id` = co.`from_address_id`
	JOIN `cars` AS ca
	ON co.`car_id` = ca.`id`
	JOIN `categories` AS cat
	ON ca.`category_id` = cat.`id`
	JOIN `clients` AS c
	ON co.`client_id` = c.`id`
	ORDER BY co.`id`;
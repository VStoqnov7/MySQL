USE `real_estate_db`;

SELECT SUBSTRING(`address`, 1, 6) AS `agent_name`,
	LENGTH(`address`) * 5430 AS `price`
	FROM `properties` AS p
	LEFT JOIN `property_offers` AS po
	ON p.`id` = po.`property_id`
	WHERE `property_id` IS NULL
	ORDER BY `agent_name` DESC, `price` DESC;
USE `real_estate_db`;

DELIMITER $$
CREATE FUNCTION udf_offers_from_city_name (cityName VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(`property_id`)
		FROM `cities` AS c
		JOIN `properties` AS p
		ON c.`id` = p.`city_id`
		JOIN `property_offers` AS po
		ON p.`id` = po.`property_id`
		WHERE c.`name` = cityName);
END$$

DELIMITER ;

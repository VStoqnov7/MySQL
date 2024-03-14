USE `airlines_db`;

DELIMITER $$
CREATE FUNCTION udf_count_flights_from_country(country VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(`departure_country`)
		FROM `flights` AS f
		JOIN `countries` AS c
		ON f.`departure_country` = c.`id`
		WHERE c.`name` = country);
END$$

DELIMITER ;

SELECT udf_count_flights_from_country('Brazil') AS 'flights_count';

SELECT udf_count_flights_from_country('Philippines') AS 'flights_count';
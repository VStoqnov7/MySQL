USE `airlines_db`;

SELECT CONCAT(UPPER(SUBSTRING(p.`last_name`, 1, 2)), p.`country_id`) AS `flight_code`,
		CONCAT(p.`first_name`, ' ', p.`last_name`) AS `full_name`,
		p.`country_id`
	FROM
		`passengers` AS p
#       LEFT JOIN `flights_passengers` AS fp 
#		ON p.`id` = fp.`passenger_id`
#	WHERE
#		fp.`passenger_id` IS NULL
	WHERE
		p.`id` NOT IN (SELECT DISTINCT `passenger_id` FROM `flights_passengers`)
	ORDER BY
		p.`country_id` ASC;
			
        
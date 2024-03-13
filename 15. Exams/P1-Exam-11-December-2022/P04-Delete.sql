USE `airlines_db`;

DELETE f, fp
	FROM `flights` AS f
	LEFT JOIN `flights_passengers` AS fp
	ON f.`id` = fp.`flight_id`
	WHERE `passenger_id` IS NULL;
USE `preserves_db`;

UPDATE `workers`
	SET `salary` = `salary` + 500
	WHERE `position_id` IN (5, 8, 11, 13);
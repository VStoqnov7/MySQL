USE `preserves_db`;

DELETE FROM `preserves`
	WHERE `established_on` IS NULL;
USE `universities_db`;

DELETE FROM `universities`
	WHERE `number_of_staff` IS NULL;
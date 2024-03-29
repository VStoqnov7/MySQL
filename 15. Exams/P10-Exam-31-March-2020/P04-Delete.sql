USE `users_db`; 

DELETE FROM addresses
	WHERE id % 3 = 0;
USE `users_db`; 

SELECT `username`,
	`gender`,
	`age`
	FROM `users` 
	ORDER BY `age` DESC, `username`;
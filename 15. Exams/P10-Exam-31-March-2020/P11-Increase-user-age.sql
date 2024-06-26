USE `users_db`; 

DELIMITER $$
CREATE PROCEDURE udp_modify_user(address VARCHAR(30), town VARCHAR(30)) 
BEGIN
	UPDATE `users` AS u
	JOIN `addresses` AS a
	ON u.`id` = a.`user_id`
	SET `age` = `age` + 10
	WHERE a.`address` = address AND a.`town` = town;
END$$

DELIMITER ;

SELECT u.username, u.email,u.gender,u.age,u.job_title FROM users AS u
WHERE u.username = 'eblagden21';

CALL udp_modify_user ('97 Valley Edge Parkway', 'Divinópolis');
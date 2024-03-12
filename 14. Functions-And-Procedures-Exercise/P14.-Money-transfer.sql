USE `soft_uni`;

DELIMITER $$
CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(19,4))
BEGIN
START TRANSACTION;
	IF from_account_id = (SELECT `id` FROM `accounts` WHERE `id` = `from_account_id`) AND
	to_account_id = (SELECT `id` FROM `accounts` WHERE `id` = `to_account_id`) AND
	amount > 0 AND 
	amount <= (SELECT `balance` FROM `accounts` WHERE `id` = `from_account_id`) THEN
	UPDATE `accounts` 
	SET `balance` = `balance` - amount
	WHERE `id` = `from_account_id`;
	UPDATE `accounts` 
	SET `balance` = `balance` + amount
	WHERE `id` = `to_account_id`;
	COMMIT;
	ELSE
	ROLLBACK;
	END IF;
END$$
	
DELIMITER ;

CALL usp_transfer_money(1, 2, 10);
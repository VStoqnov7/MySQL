USE `soft_uni`;

DELIMITER $$
CREATE FUNCTION ufn_calculate_future_value(`sum` DECIMAL(19,4), `interest_rate` DOUBLE, `year` INT)
RETURNS DECIMAL(19,4)
DETERMINISTIC
BEGIN
	DECLARE future_sum DECIMAL(19, 4);
	SET future_sum := `sum` * POW(1 + `interest_rate`, `year`);
	RETURN future_sum;
END$$  #Judge want here this ";" NOT THIS "$$"

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE usp_calculate_future_value_for_account(`id` INT, `interest_rate` DECIMAL(19,4))
BEGIN
   SELECT a.`id` AS 'account_id',
    ah.`first_name`, ah.`last_name`, 
    a.`balance` AS 'current_balance', 
    ufn_calculate_future_value(a.`balance`, `interest_rate`, 5) AS 'balance_in_5_years'
    FROM `account_holders` AS ah
    JOIN `accounts` AS a 
    ON a.`account_holder_id` = ah.`id`
    WHERE a.`id` = `id`;
END$$  #Judge want here this ";" NOT THIS "$$"

DELIMITER ;

CALL usp_calculate_future_value_for_account(1, 0.1);
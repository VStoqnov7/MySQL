USE `soft_uni`;

DELIMITER $$
CREATE PROCEDURE usp_withdraw_money(account_id INT , money_amount DECIMAL(19,4))
BEGIN 
START TRANSACTION;
  IF `money_amount` > 0 AND `money_amount` <= (SELECT `balance` FROM `accounts` AS a WHERE a.`id` = account_id) THEN
    UPDATE `accounts` AS ac 
    SET ac.`balance` = ac.`balance` - money_amount
    WHERE ac.`id` = account_id;
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END$$

DELIMITER ;

CALL usp_withdraw_money(1, 10);
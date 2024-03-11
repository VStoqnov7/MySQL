USE `soft_uni`;

DELIMITER $$
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(`money` decimal(19,4))
BEGIN
    SELECT ah.`first_name`, ah.`last_name`
    FROM `account_holders` as ah
    JOIN `accounts` as a 
    ON ah.`id` = a.`account_holder_id`
    GROUP BY ah.`id`, ah.`first_name`, ah.`last_name`
    HAVING SUM(a.`balance`) > `money`
    ORDER BY ah.`id`;
END$$

DELIMITER ;

CALL usp_get_holders_with_balance_higher_than(7000);


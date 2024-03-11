USE `soft_uni`;

DELIMITER $$
CREATE FUNCTION ufn_calculate_future_value(`sum` DECIMAL(19,4), `interest_rate` DOUBLE, `year` INT)
RETURNS DECIMAL(19,4)
DETERMINISTIC
BEGIN
	DECLARE future_sum DECIMAL(19, 4);
	SET future_sum := `sum` * POW(1 + `interest_rate`, `year`);
	RETURN future_sum;
END$$

DELIMITER ;

SELECT ufn_calculate_future_value(1000, 0.5, 5);


 
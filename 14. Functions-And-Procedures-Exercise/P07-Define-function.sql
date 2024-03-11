USE `soft_uni`;

DELIMITER $$
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS INT (1)
DETERMINISTIC
BEGIN
# RETURN word REGEXP (CONCAT('^[', set_of_letters, ']+$'));
	DECLARE set_length INT;
	DECLARE word_length INT;
	DECLARE i INT;
	SET word_length = LENGTH(word);
	SET i = 1;
	WHILE i <= word_length DO
	IF LOCATE(SUBSTRING(word, i, 1), set_of_letters) = 0 THEN RETURN 0; 
	END IF;
	SET i = i + 1;
	END WHILE;
	RETURN 1; 
END$$

DELIMITER ;

SELECT ufn_is_word_comprised('oistmiahf', 'Sofia');
SELECT ufn_is_word_comprised('oistmiahf', 'halves');
SELECT ufn_is_word_comprised('bobr', 'Rob');
SELECT ufn_is_word_comprised('pppp', 'Guy');






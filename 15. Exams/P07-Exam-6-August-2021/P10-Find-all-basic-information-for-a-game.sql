USE `games`;

DELIMITER $$
CREATE FUNCTION udf_game_info_by_name (game_name VARCHAR (20))
RETURNS TEXT
DETERMINISTIC 
BEGIN
	
    DECLARE team_name VARCHAR(40);
    DECLARE address VARCHAR(50);
    
    SET team_name = (SELECT t.`name` 
		FROM `teams` AS t 
		JOIN `games` AS g 
		ON t.`id` = g.`team_id`
		WHERE g.`name` = game_name
		LIMIT 1
	);
    SET address = (SELECT a.`name` 
		FROM `addresses` AS a 
		JOIN `offices` AS o 
		ON a.`id` = o.`address_id`
		JOIN `teams` AS t
		ON o.`id` = t.`office_id`
		JOIN `games` AS g
		ON t.`id` = g.`team_id`
		WHERE g.`name` = game_name
		LIMIT 1
	);

	RETURN CONCAT('The ', game_name, ' is developed by a ', team_name, ' in an office with an address ', address) ;

END$$

DELIMITER ; 


                
                
                
                
                
USE `soft_uni`;

SELECT `town_id`, `name`
	FROM `towns`
    WHERE LOWER(`name`) 
    NOT LIKE('r%') AND LOWER(`name`) 
    NOT LIKE('b%') AND LOWER(`name`) 
    NOT LIKE ('d%')
    ORDER BY `name`;
    
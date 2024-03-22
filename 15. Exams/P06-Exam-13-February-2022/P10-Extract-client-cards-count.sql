USE `online_store`;

DELIMITER $$
CREATE FUNCTION udf_customer_products_count(name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
RETURN (SELECT COUNT(`product_id`)
	FROM `orders_products` AS op
	JOIN `orders` AS o
	ON op.`order_id` = o.`id`
	JOIN `customers` AS c
	ON o.`customer_id` = c.`id`
	WHERE c.`first_name` = name);
END$$

DELIMITER ;

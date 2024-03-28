USE `softuni`;

DELIMITER $$
CREATE PROCEDURE udp_update_product_price (address_name VARCHAR(50))
BEGIN
	DECLARE price_increase INT;
	IF SUBSTRING(address_name, 1, 1) = '0' THEN
		SET price_increase = 100;
	ELSE
		SET price_increase = 200;
	END IF;

	UPDATE products AS p
	JOIN `products_stores` AS ps
	ON p.`id` = ps.`product_id`
	JOIN `stores` AS s
	ON ps.`store_id` = s.`id`
	JOIN `addresses` AS a
	ON s.`address_id` = a.`id`
	SET price = price + price_increase
	WHERE a.`name` = address_name;

#    UPDATE products
#	 JOIN `products_stores` AS ps
#    ON p.`id` = ps.`product_id`
#    JOIN `stores` AS s
#    ON ps.`store_id` = s.`id`
#    JOIN `addresses` AS a
#    ON s.`address_id` = a.`id`
#    SET price = price + 
#        CASE WHEN SUBSTRING(address_name, 1, 1) = '0' THEN 100
#             ELSE 200
#        END
#	 WHERE a.`name` = address_name;

END$$

DELIMITER ;

CALL udp_update_product_price('07 Armistice Parkway');
SELECT name, price FROM products WHERE id = 15;

CALL udp_update_product_price('1 Cody Pass');
SELECT name, price FROM products WHERE id = 17;


USE `real_estate_db`;

INSERT INTO `property_transactions`(`property_id`, `buyer_id`, `transaction_date`, `bank_name`, `iban`, `is_successful`)
	SELECT `agent_id` + DAY(`offer_datetime`) AS `property_id`,
		`agent_id`+ MONTH(`offer_datetime`) AS `buyer_id`,
		DATE(`offer_datetime`) AS `transaction_date`,
		CONCAT('Bank', ' ', `agent_id`) AS `bank_name`,
		CONCAT('BG', `price`, `agent_id`) AS `iban`,
		1
	FROM `property_offers` 
	WHERE `agent_id` <= 2;
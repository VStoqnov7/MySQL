USE `camp`;

SELECT `starting_point` AS `route_startin_point`,
	`end_point` AS `route_ending_point`,
    `leader_id`,
    CONCAT_WS(' ', `first_name`, `last_name`) AS `leader_name`
    FROM `routes`
    JOIN `campers` ON routes.leader_id = campers.id;
    
    
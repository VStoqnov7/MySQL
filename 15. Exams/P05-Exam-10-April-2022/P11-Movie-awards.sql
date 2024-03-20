USE `softuni_imdb`;

DELIMITER $$
CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
BEGIN
	UPDATE `actors` AS a
	JOIN `movies_actors` AS mc
	ON a.`id` = mc.`actor_id`
	JOIN `movies` AS m
	ON mc.`movie_id` = m.`id`
	SET a.`awards` = a.`awards` + 1
	WHERE m.`title` = movie_title;
END$$

DELIMITER ;

CALL udp_award_movie('Tea For Two');
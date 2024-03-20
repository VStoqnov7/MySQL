USE `softuni_imdb`;

DELIMITER $$
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (
        SELECT COUNT(DISTINCT mc.`movie_id`)
        FROM `actors` AS a
        JOIN `movies_actors` AS mc 
        ON a.`id` = mc.`actor_id`
        JOIN `genres_movies` AS gm 
        ON mc.`movie_id` = gm.`movie_id`
        JOIN `genres` AS g ON gm.`genre_id` = g.`id`
        WHERE CONCAT(a.`first_name`, ' ', a.`last_name`) = full_name
            AND g.`name` = 'History'
    );
END$$

DELIMITER ;

SELECT udf_actor_history_movies_count('Stephan Lundberg')  AS 'history_movies';

SELECT udf_actor_history_movies_count('Jared Di Batista')  AS 'history_movies';
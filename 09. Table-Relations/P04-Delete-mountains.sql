USE `camp`;

DROP TABLE peaks;
DROP TABLE mountains;


CREATE TABLE `mountains`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL
);

CREATE TABLE `peaks`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	`mountain_id` INT,
	CONSTRAINT `fk_mountain_id` 
	FOREIGN KEY(`mountain_id`)
	REFERENCES `mountains`(`id`)
	ON DELETE CASCADE
);


INSERT INTO mountains(`name`) VALUES ('Rila'), ('Pirin');
INSERT INTO peaks(`name`, mountain_id) VALUES ('Vihren1', 2), ('Vihren2', 2), ('Vihren3', 2);

SELECT * FROM mountains;
SELECT * FROM peaks;

DELETE FROM peaks WHERE id = 2;
DELETE FROM mountains WHERE id = 2;
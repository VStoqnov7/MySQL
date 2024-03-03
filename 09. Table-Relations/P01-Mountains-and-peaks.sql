USE `camp`;

CREATE TABLE `mountains`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    CONSTRAINT pk_mountains_id PRIMARY KEY (id)
);


INSERT INTO mountains(`name`) VALUES ('Rila'), ('Pirin');


CREATE TABLE `peaks`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `mountain_id` INT,
    CONSTRAINT fk__peaks_mountain_id__mountain_id
    FOREIGN KEY (mountain_id)
    REFERENCES mountains(id)
);

INSERT INTO peaks(`name`, mountain_id)
	VALUES ('Musala',1), ('Vihren',2);
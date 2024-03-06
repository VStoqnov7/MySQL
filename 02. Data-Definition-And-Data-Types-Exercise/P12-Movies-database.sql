USE `movies`;

CREATE TABLE `directors`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);


CREATE TABLE `genres` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);


CREATE TABLE `categories`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);


CREATE TABLE `movies`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `director_id` INT,
    `copyright_year` INT,
    `length` INT,
    `genre_id` INT,
    `category_id` INT,
    `rating` DECIMAL(3,2),
    `notes` TEXT
);

INSERT INTO `directors` (`director_name`,`notes`) VALUES 
					('Director1', 'Notes1'),
					('Director2', 'Notes2'),
					('Director3', 'Notes3'),
					('Director4', 'Notes4'),
					('Director5', 'Notes5');

INSERT INTO `categories` (`category_name`,`notes`) VALUES 
					('Category1','Notes1'),
                    ('Category2','Notes2'),
                    ('Category3','Notes3'),
                    ('Category4','Notes4'),
                    ('Category5','Notes5');

INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`) VALUES
					('Movie1', 1, 2020, 120, 1, 1, 8.5, 'Notes1'),
                    ('Movie2', 2, 2018, 110, 2, 2, 7.8, 'Notes2'),
                    ('Movie3', 3, 2022, 95, 3, 3, 6.4, 'Notes3'),
                    ('Movie4', 4, 2019, 135, 4, 4, 9.2, 'Notes4'),
                    ('Movie5', 5, 2021, 100, 5, 5, 8.0, 'Notes5');






USE `exercise`;

CREATE TABLE `users`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted` BOOLEAN
);

INSERT INTO `users` (`username`,`password`)
VALUES
	("pesho1","1234"),
    ("ivan2","gotinsam"),
    ("test","test1234"),
    ("test1","test1"),
    ("test2","test5");
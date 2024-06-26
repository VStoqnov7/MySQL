CREATE DATABASE `users_db`;

USE `users_db`; 

CREATE TABLE `users`(
	`id` INT PRIMARY KEY,
	`username` VARCHAR(30) NOT NULL UNIQUE,
	`password` VARCHAR(30) NOT NULL,
	`email` VARCHAR(50) NOT NULL,
	`gender` CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
	`age` INT NOT NULL,
	`job_title` VARCHAR(40) NOT NULL,
	`ip` VARCHAR(30) NOT NULL
);

CREATE TABLE `addresses`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`address` VARCHAR(30) NOT NULL,
	`town` VARCHAR(30) NOT NULL,
	`country` VARCHAR(30) NOT NULL,
	`user_id` INT NOT NULL,
	CONSTRAINT fk_addresses_users
	FOREIGN KEY (user_id)
	REFERENCES users(id)
);

CREATE TABLE `photos`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`description` TEXT NOT NULL,
	`date` DATETIME NOT NULL,
	`views` INT DEFAULT 0 NOT NULL
);

CREATE TABLE `comments`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`comment` VARCHAR(255) NOT NULL,
	`date` DATETIME NOT NULL,
	`photo_id` INT NOT NULL,
	CONSTRAINT fk_comments_photos
	FOREIGN KEY (photo_id)
	REFERENCES photos(id)
);

CREATE TABLE `users_photos`(
	`user_id` INT NOT NULL,
	`photo_id` INT NOT NULL,
	CONSTRAINT fk_user_photos_users
	FOREIGN KEY (user_id)
	REFERENCES users(id),
	CONSTRAINT fk_user_photos_photos
	FOREIGN KEY (photo_id)
	REFERENCES photos(id)
);

CREATE TABLE `likes`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`photo_id` INT,
	`user_id` INT,
	CONSTRAINT fk_like_photos
	FOREIGN KEY (photo_id)
	REFERENCES photos(id),
	CONSTRAINT fk_like_users
	FOREIGN KEY (user_id)
	REFERENCES users(id)
);


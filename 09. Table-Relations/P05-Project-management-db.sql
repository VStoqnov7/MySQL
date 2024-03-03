CREATE DATABASE `management`;

USE `management`;

CREATE TABLE `clients`(
	`id` INT AUTO_INCREMENT,
    `client_name` VARCHAR(100),
    CONSTRAINT pk_client_id PRIMARY KEY (id)
);

CREATE TABLE `projects`(
	`id` INT AUTO_INCREMENT,
    `client_id` INT,
    `project_lead_id` INT,
    CONSTRAINT pk_project_id PRIMARY KEY (id),
    CONSTRAINT fk_project_client_id__client_id
    FOREIGN KEY (client_id)
    REFERENCES clients(id)
);

CREATE TABLE `employees`(
	`id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(30),
    `last_name` VARCHAR(30),
    `project_id` INT,
    CONSTRAINT pk_employees_id PRIMARY KEY (id),
    CONSTRAINT fk_employees_id__projects_id
    FOREIGN KEY (project_id)
    REFERENCES projects(id)
);

ALTER TABLE projects
	ADD CONSTRAINT fk__projects_project_lead_id__employees_id
    FOREIGN KEY (project_lead_id)
    REFERENCES employees(id);




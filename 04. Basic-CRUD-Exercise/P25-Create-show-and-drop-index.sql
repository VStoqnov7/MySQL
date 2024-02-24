USE `soft_uni`;

CREATE INDEX index1 ON `employees` (`job_title`);

SHOW INDEXES FROM `employees`;

ALTER TABLE `employees`
DROP INDEX `index1`;
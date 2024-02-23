USE `soft_uni`;

SELECT 
    CONCAT(`employee_id`) AS `id`,
    CONCAT(`first_name`) AS `First Name`,
    CONCAT(`last_name`) AS `Last Name`,
    CONCAT(`middle_name`) AS `Middle Name`,
    `job_title`,
    CONCAT(`department_id`) AS `Dept ID`,
    CONCAT(`manager_id`) AS `Mngr ID`,
    DATE_FORMAT(`hire_date`, '%Y-%m-%d %H:%i:%s') AS `Hire Date`,
    `salary`,
    `address_id` 
FROM 
    `employees` 
ORDER BY 
    `salary` DESC,
    `first_name`,
    `last_name` DESC,
    `middle_name`,
    `department_id`;
        
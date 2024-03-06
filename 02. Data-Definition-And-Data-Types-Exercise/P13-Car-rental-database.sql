USE `car_rental`;

CREATE TABLE `categories` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(255) NOT NULL,
    `daily_rate` DECIMAL(8,2) NOT NULL,
    `weekly_rate` DECIMAL(8,2) NOT NULL,
    `monthly_rate` DECIMAL(8,2) NOT NULL,
    `weekend_rate` DECIMAL(8,2) NOT NULL
);

CREATE TABLE `cars` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `plate_number` VARCHAR(255) NOT NULL,
    `make` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `car_year` INT NOT NULL,
    `category_id` INT NOT NULL,
    `doors` INT NOT NULL,
    `picture` BLOB,
    `car_condition` VARCHAR(255),
    `available` BOOLEAN NOT NULL
);


CREATE TABLE `employees` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `notes` TEXT
);


CREATE TABLE `customers`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `driver_licence_number` VARCHAR(255) NOT NULL,
    `full_name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `city` VARCHAR (255) NOT NULL,
    `zip_code` VARCHAR(255) NOT NULL,
    `notes` TEXT
);



CREATE TABLE `rental_orders` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT,
    `customer_id` INT,
    `car_id` INT,
    `car_condition` VARCHAR(255),
    `tank_level` DECIMAL(8,2),
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE,
    `end_date` DATE,
    `total_days` INT,
    `rate_applied` DECIMAL(8,2),
    `tax_rate` DECIMAL(8,2),
    `order_status` VARCHAR(255),
    `notes` TEXT
);


INSERT INTO `categories` (`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`) VALUES
			('Economy', 30.00, 180.00, 600.00, 50.00),
            ('Midsize', 40.00, 240.00, 800.00, 60.00),
            ('Luxury', 60.00, 400.00, 1500.00, 100.00);


INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `picture`, `car_condition`, `available`) VALUES
			('ABC123', 'Toyota', 'Camry', 2020, 1, 4, 'car1.jpg', 'Good condition', TRUE),
            ('XYZ789', 'Honda', 'Accord', 2021, 2, 4, 'car2.jpg', 'Excellent condition', TRUE),
            ('123DEF', 'Mercedes', 'S-Class', 2019, 3, 4, 'car3.jpg', 'Like new', TRUE);

INSERT INTO `employees` (`first_name`, `last_name`, `title`, `notes`) VALUES 
			('John', 'Doe', 'Manager', 'Manager notes'),
            ('Jane', 'Smith', 'Sales Representative', 'Sales notes'),
            ('Robert', 'Johnson', 'Customer Service', 'Customer service notes');
            
	


INSERT INTO `customers` (`driver_licence_number`, `full_name`, `address`, `city`, `zip_code`, `notes`) VALUES
			('DL123456', 'Alice Johnson', '123 Main St', 'Cityville', '12345', 'Customer notes'),
            ('DL789012', 'Bob Smith', '456 Oak St', 'Townsville', '67890', 'Customer notes'),
            ('DL345678', 'Charlie Brown', '789 Pine St', 'Villagetown', '45678', 'Customer notes');
            
            
            
INSERT INTO `rental_orders` (`employee_id`,
							`customer_id`,
                            `car_id`,
                            `car_condition`,
                            `tank_level`, 
                            `kilometrage_start`,
                            `kilometrage_end`,
                            `total_kilometrage`,
                            `start_date`,
                            `end_date`,
                            `total_days`,
                            `rate_applied`, 
                            `tax_rate`,
                            `order_status`,
                            `notes`)  VALUES
                            ( 1, 1, 1, 'Good', 0.75, 5000, 5500, 500, '2023-01-01', '2023-01-05', 5, 180.00, 0.10, 'Completed', 'Rental order notes'),
                            (2, 2, 2, 'Excellent', 0.80, 6000, 6500, 500, '2023-02-01', '2023-02-04', 4, 240.00, 0.10, 'Completed', 'Rental order notes'),
                            (3, 3, 3, 'Like new', 0.90, 7000, 7500, 500, '2023-03-01', '2023-03-03', 3, 400.00, 0.10, 'In Progress', 'Rental order notes');









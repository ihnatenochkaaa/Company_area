USE company;

ALTER TABLE `department` MODIFY `street` varchar(50) NOT NULL;
ALTER TABLE `department` MODIFY `building_no` int(4);
ALTER TABLE `department` ALTER `city` SET DEFAULT 'Lviv';

ALTER TABLE `employee` MODIFY `position` varchar(30) NOT NULL;
ALTER TABLE `employee` ADD UNIQUE (`user_name`);

ALTER TABLE `customer` MODIFY `phone_number` bigint(15) NOT NULL;
ALTER TABLE `customer` MODIFY `discount` int(2);

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` bigint(15) NOT NULL,
  `employee_id` int NOT NULL,
  `customer_id` int,
  `payment_method` int NOT NULL,
  `transaction_moment` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  CONSTRAINT `invoice_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `invoice_fk1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
);

ALTER TABLE `orders` DROP FOREIGN KEY `orders_fk1`;
ALTER TABLE `orders` DROP FOREIGN KEY `orders_fk3`;

ALTER TABLE `orders` 
  DROP COLUMN `employee_id`,
  DROP COLUMN `customer_id`,
  DROP COLUMN `transaction_type`,
  DROP COLUMN `transaction_moment`,
  DROP COLUMN `amount`;

ALTER TABLE `orders` 
  ADD COLUMN `invoice_id` bigint(15) NOT NULL,
  ADD COLUMN `order_datetime` datetime NOT NULL,
  ADD COLUMN `quantity` int(11) NOT NULL;

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk4` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`);
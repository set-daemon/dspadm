CREATE DATABASE IF NOT EXISTS dsp_adm_db;
/* DROP DATABASE IF EXISTS dsp_adm_db; */

/*
 * 客户账户
 */
CREATE TABLE IF NOT EXISTS `customer_account` (
	`customer_id` INTEGER NOT NULL,
	`balance` FLOAT NOT NULL,
	`consume` FLOAT NOT NULL
);

/*
 * 订单账单
 */
CREATE TABLE IF NOT EXISTS `order_day_bill` (
	`order_id` BIGINT NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`bill_date` DATE NOT NULL,
	`bill_amount` FLOAT NOT NULL,
	`status` INTEGER NOT NULL
);

/*
 * 客户充值记录
 */
CREATE TABLE IF NOT EXISTS `recharge_record` (
	`customer_id` INTEGER NOT NULL,
	`recharge_time` DATETIME NOT NULL,
	`recharge_amount` FLOAT NOT NULL,
	`channel` VARCHAR(63) NOT NULL,
	`operator` INTEGER NOT NULL
);

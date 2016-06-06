CREATE DATABASE IF NOT EXISTS dsp_adm_db;
/* DROP DATABASE IF EXISTS dsp_adm_db; */
USE `dsp_adm_db`;

/*
 * 订单
 */
CREATE TABLE IF NOT EXISTS `order` (
	`order_id` INTEGER NOT NULL AUTO_INCREMENT,
	`customer_id` INTEGER NOT NULL,
	`user_id` INTEGER NOT NULL,
	`order_name` VARCHAR(255) NOT NULL,
	`budget` FLOAT NOT NULL,
	`order_type` INTEGER NOT NULL,
	`contract_sn` VARCHAR(127) NOT NULL,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`order_desc` VARCHAR(255) NOT NULL,
	`status` INTEGER NOT NULL,
	`status_alter_corp` INTEGER NOT NULL,
	`discount` FLOAT NOT NULL,

	PRIMARY KEY(`order_id`)
);

/*
 * 订单-计划
 */
CREATE TABLE IF NOT EXISTS `order_plan` (
	`plan_id` INTEGER NOT NULL AUTO_INCREMENT,
	`order_id` INTEGER NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`user_id` INTEGER NOT NULL,
	`plan_name` VARCHAR(255) NOT NULL,
	`budget` FLOAT NOT NULL,
	`day_budget` FLOAT NOT NULL,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`e_imps` INTEGER NOT NULL,
	`e_dayimps` INTEGER NOT NULL,
	`e_audience` INTEGER NOT NULL,
	`e_clicks` INTEGER NOT NULL,
	`e_dayclicks` INTEGER NOT NULL,
	`e_cpm` FLOAT NOT NULL,
	`e_cpc` FLOAT NOT NULL,
	`e_a` INTEGER NOT NULL,
	`deal_type` INTEGER NOT NULL,
	`create_time` DATETIME NOT NULL,
	`modify_time` DATETIME NOT NULL,
	`status` INTEGER NOT NULL,
	`state` INTEGER NOT NULL,

	PRIMARY KEY(`plan_id`)
);

/*
 * 订单-策略组
 */
CREATE TABLE IF NOT EXISTS `order_group` (
	`group_id` INTEGER NOT NULL AUTO_INCREMENT,

	`plan_id` INTEGER NOT NULL,
	`order_id` INTEGER NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`user_id` INTEGER NOT NULL,

	`group_name` VARCHAR(255) NOT NULL,
	`budget` FLOAT NOT NULL,
	`day_budget` FLOAT NOT NULL,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,

	`e_imps` INTEGER NOT NULL,
	`e_dayimps` INTEGER NOT NULL,
	`e_audience` INTEGER NOT NULL,
	`e_clicks` INTEGER NOT NULL,
	`e_dayclicks` INTEGER NOT NULL,
	`e_cpm` FLOAT NOT NULL,
	`e_cpc` FLOAT NOT NULL,
	`e_a` INTEGER NOT NULL,
	`user_dayimps` INTEGER NOT NULL,
	`imp_smoothing` INTEGER NOT NULL,

	`flow_type` INTEGER NOT NULL,

	`create_time` DATETIME NOT NULL,
	`modify_time` DATETIME NOT NULL,
	`status` INTEGER NOT NULL,
	`state` INTEGER NOT NULL,

	PRIMARY KEY(`group_id`)
);

/*
 * 策略组ADX行业信息
 */
CREATE TABLE IF NOT EXISTS `adgroup_vocation` (
	`group_id` INTEGER NOT NULL,
	`adx_id` INTEGER NOT NULL,
	`voc_l1` INTEGER NOT NULL,
	`voc_l2` INTEGER NOT NULL
);

/*
 * 策略组ADX敏感行业信息
 */
CREATE TABLE IF NOT EXISTS `adgroup_sensitive_vocation` (
	`group_id` INTEGER NOT NULL,
	`adx_id` INTEGER NOT NULL,
	`voc_l1` INTEGER NOT NULL,
	`voc_l2` INTEGER NOT NULL
);

/*
 * 订单-策略表
 */
CREATE TABLE IF NOT EXISTS `order_strategy` (
	`group_id` INTEGER NOT NULL,
	`data_type` VARCHAR(16) NOT NULL,
	`data_name` VARCHAR(127) NOT NULL,
	`data` VARCHAR(1024) NOT NULL
);


/*
 * 广告表
 */
CREATE TABLE IF NOT EXISTS `order_ad` (
	`ad_id` INTEGER NOT NULL AUTO_INCREMENT,

	`group_id` INTEGER NOT NULL,
	`plan_id` INTEGER NOT NULL,
	`order_id` INTEGER NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`user_id` INTEGER NOT NULL,

	`ad_name` VARCHAR(255) NOT NULL,
	`ad_type` INTEGER NOT NULL,
	`click_efficient` INTEGER NOT NULL,
	`slot_type` INTEGER NOT NULL,
	`status` INTEGER NOT NULL,

	PRIMARY KEY(`ad_id`)
);

/*
 * 广告属性
 */
CREATE TABLE IF NOT EXISTS `ad_attr` (
	`ad_id` INTEGER NOT NULL,
	`attr_name` VARCHAR(127) NOT NULL,
	`attr` VARCHAR(255) NOT NULL
);

/*
 * 点击效果数据
 */
CREATE TABLE IF NOT EXISTS `ad_clickdata` (
	`ad_id` INTEGER NOT NULL,
	`data_name` VARCHAR(127) NOT NULL,
	`data` VARCHAR(255) NOT NULL
);


/*
 * 广告投放第三方监测表
 */
CREATE TABLE IF NOT EXISTS `ad_3rd_tracker` (
	`ad_id` INTEGER NOT NULL,
	`vendor_name` VARCHAR(63) NOT NULL,
	`track_type` INTEGER NOT NULL,
	`track_url` VARCHAR(255) NOT NULL
);

/*
 * 广告的DSP监测表
 */
CREATE TABLE IF NOT EXISTS `dsp_admon` (
	`adx_id` INTEGER NOT NULL,
	`track_type` INTEGER NOT NULL,
	`track_url` VARCHAR(255) NOT NULL
);

/*
 * 广告ADX审核数据
 */
CREATE TABLE IF NOT EXISTS `ad_audit_data` (
	`ad_id` INTEGER NOT NULL,
	`adx_id` INTEGER NOT NULL,
	`status` INTEGER NOT NULL,
	`audit_time` DATETIME NOT NULL,
	`updated` INTEGER NOT NULL,
	`update_time` DATETIME NOT NULL
);

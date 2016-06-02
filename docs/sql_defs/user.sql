CREATE DATABASE IF NOT EXISTS `dsp_adm_db`;
/* DROP DATABASE IF EXISTS dsp_adm_db; */
USE `dsp_adm_db`;

/*
 * 客户申请表
 */
CREATE TABLE IF NOT EXISTS `customer_application` (
	`app_id` BIGINT NOT NULL AUTO_INCREMENT,
	`corp_name` VARCHAR(129) NOT NULL,
	`site_name` VARCHAR(129) NOT NULL,
	`website` VARCHAR(128) NOT NULL,
	`icp_code` VARCHAR(128) NOT NULL,
	`customer_type` INTEGER NOT NULL,
	`corp_qualification_url` VARCHAR(128) NOT NULL,
	`legal_person_id_url` VARCHAR(128) NOT NULL,		
	`phone` VARCHAR(18) NOT NULL,
	`fax` VARCHAR(18) NOT NULL,

	`app_name` VARCHAR(63) NOT NULL,
	`app_email` VARCHAR(128) NOT NULL,
	`app_telphone` VARCHAR(63) NOT NULL,

	`status` INTEGER NOT NULL,
	`app_time` DATETIME NOT NULL,
	`auditor` VARCHAR(129) NOT NULL,
	`audit_time` DATETIME NOT NULL,

	PRIMARY KEY(`app_id`)
);

/*
 * 系统运营商信息
 */
CREATE TABLE IF NOT EXISTS `sys_operator` (
	`corp_name` VARCHAR(129) NOT NULL,
	`website` VARCHAR(128) NOT NULL,
	`address` VARCHAR(255) NOT NULL,
	`zipcode` VARCHAR(9) NOT NULL,
	`phone` VARCHAR(18) NOT NULL,
	`fax` VARCHAR(18) NOT NULL,
	`email` VARCHAR(128) NOT NULL,
	`logo` VARCHAR(128) NOT NULL	
);

/*
 * 系统用户信息
 */
CREATE TABLE IF NOT EXISTS `sys_user` (
	`user_id` INTEGER NOT NULL AUTO_INCREMENT,
	`role` INTEGER NOT NULL,
	`name` VARCHAR(129) NOT NULL,
	`email` VARCHAR(128) NOT NULL,
	`passwd` VARCHAR(129) NOT NULL,
	`status` INTEGER NOT NULL,
	`join_time` DATETIME NOT NULL,
	
	PRIMARY KEY(`user_id`)
);
ALTER TABLE `sys_user`  AUTO_INCREMENT=1;

/*
 * 客户信息
 */
CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` INTEGER NOT NULL AUTO_INCREMENT,
	`corp_name` VARCHAR(129) NOT NULL,
	`address` VARCHAR(255) NOT NULL,
	`zipcode` VARCHAR(9) NOT NULL,
	`site_name` VARCHAR(129) NOT NULL,
	`website` VARCHAR(128) NOT NULL,
	`icp_code` VARCHAR(128) NOT NULL,
	`customer_type` INTEGER NOT NULL,
	`corp_qualification_url` VARCHAR(128) NOT NULL,
	`legal_person_id_url` VARCHAR(128) NOT NULL,		
	`phone` VARCHAR(18) NOT NULL,
	`fax` VARCHAR(18) NOT NULL,
	`logo` VARCHAR(128) NOT NULL,

	`status` INTEGER NOT NULL,
	`join_time` DATETIME NOT NULL,

	PRIMARY KEY(`customer_id`)
);
ALTER TABLE `customer`  AUTO_INCREMENT=1;

/*
 * 客户用户
 */
CREATE TABLE IF NOT EXISTS `customer_user` (
	`user_id` INTEGER NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(129) NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`customer_type` INTEGER NOT NULL,
	`role` INTEGER NOT NULL,
	`email` VARCHAR(128) NOT NULL,
	`passwd` VARCHAR(129) NOT NULL,
	`status` INTEGER NOT NULL,
	`join_time` DATETIME NOT NULL,
	
	PRIMARY KEY(`user_id`)
);
ALTER TABLE `customer_user`  AUTO_INCREMENT=4026531840; /* 0xF0000000 */

/*
 * 代理商的客户
 */
CREATE TABLE IF NOT EXISTS `agency_customer` (
	`customer_id` INTEGER NOT NULL AUTO_INCREMENT,
	`customer_owner` INTEGER NOT NULL,
	`corp_name` VARCHAR(129) NOT NULL,
	`address` VARCHAR(255) NOT NULL,
	`zipcode` VARCHAR(9) NOT NULL,
	`site_name` VARCHAR(129) NOT NULL,
	`website` VARCHAR(128) NOT NULL,
	`icp_code` VARCHAR(128) NOT NULL,
	`customer_type` INTEGER NOT NULL,
	`corp_qualification_url` VARCHAR(128) NOT NULL,
	`legal_person_id_url` VARCHAR(128) NOT NULL,		
	`phone` VARCHAR(18) NOT NULL,
	`fax` VARCHAR(18) NOT NULL,
	`logo` VARCHAR(128) NOT NULL,

	`status` INTEGER NOT NULL,
	`join_time` DATETIME NOT NULL,

	PRIMARY KEY(`customer_id`)
);
ALTER TABLE `agency_customer`  AUTO_INCREMENT=4026531840; /* 0xF0000000 */

/*
 * 代理商的用户与客户关系
 */
CREATE TABLE IF NOT EXISTS `agency_user_customer` (
	`user_id` INTEGER NOT NULL,
	`agency_id` INTEGER NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`status` INTEGER NOT NULL,
	`create_time` DATETIME NOT NULL,
	`operator` INTEGER NOT NULL
);

/*
 * 客户ADX审核数据
 */
CREATE TABLE IF NOT EXISTS `customer_audit_data` (
	`customer_id` INTEGER NOT NULL,
	`adx_id` INTEGER NOT NULL,
	`status` INTEGER NOT NULL,
	`audit_time` DATETIME NOT NULL,
	`updated` INTEGER NOT NULL,
	`update_time` DATETIME NOT NULL
);

/*
 * 客户在ADX的标识
 */
CREATE TABLE IF NOT EXISTS `adx_customer` (
	`customer_id` INTEGER NOT NULL,
	`adx_id` INTEGER NOT NULL,
	`adx_customer_key` VARCHAR(128),
);

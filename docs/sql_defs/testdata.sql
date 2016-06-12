
use dsp_adm_db;

/*
 * 系统运营商
 */
INSERT INTO `sys_operator`(`corp_name`, `website`, `address`, `phone`, `fax`, `zipcode`, `email`, `logo`) VALUES("DSP广告系统运营公司", "www.dsp-op.com", "北京市西城区阜成门", "010-63791123", "010-63791124", "110011", "service@dsp-op.com", "http://data.dsp-op.com/images/logo.png")

/*
 * 客户数据
 */
/* 广告主 */
INSERT INTO `customer`(`corp_name`,`address`,`zipcode`,`site_name`,`website`,`icp_code`,`customer_type`,`corp_qualification_url`,`legal_person_id_url`,`phone`,`fax`,`logo`,`status`,`join_time`) VALUES('宝马北京', '北京市朝阳区', '1000001', '宝马-北京', 'bj.baoma.com', '123x-334', 2, '', '', '010-66775567', '010-66775568', '', 4, CURRENT_TIMESTAMP());
/* 代理商 */
INSERT INTO `customer`(`corp_name`,`address`,`zipcode`,`site_name`,`website`,`icp_code`,`customer_type`,`corp_qualification_url`,`legal_person_id_url`,`phone`,`fax`,`logo`,`status`,`join_time`) VALUES('飞立股份', '上海宝山区', '3000001', '飞立股份有限公司', 'www.feillie.com', '123x-334', 1, '', '', '010-66775567', '010-66775568', '', 4, CURRENT_TIMESTAMP());
/* 代理商的广告主 */
INSERT INTO `agency_customer`(`customer_owner`, `corp_name`,`address`,`zipcode`,`site_name`,`website`,`icp_code`,`customer_type`,`corp_qualification_url`,`legal_person_id_url`,`phone`,`fax`,`logo`,`status`,`join_time`) VALUES(2, '奔驰北京', '北京市朝阳区', '1000001', '奔驰-北京', 'bj.benchi.com', '123x-334', 2, '', '', '010-66775567', '010-66775568', '', 4, CURRENT_TIMESTAMP());

/*
 * 客户审核数据
 * adx_id为搜狐的
 */
INSERT INTO `customer_audit_data`(`customer_id`,`adx_id`,`status`,`audit_time`,`updated`, `update_time`) VALUES(2, 0x1000, 0, CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP());
INSERT INTO `customer_audit_data`(`customer_id`,`adx_id`,`status`,`audit_time`,`updated`,`update_time`) VALUES(2, 0x10, 0, CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP());

INSERT INTO `customer_audit_data`(`customer_id`,`adx_id`,`status`,`audit_time`,`updated`,`update_time`) VALUES(268435456, 0x1000, 0, CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP());
INSERT INTO `customer_audit_data`(`customer_id`,`adx_id`,`status`,`audit_time`,`updated`,`update_time`) VALUES(268435456, 0x10, 0, CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP());

/*
 * 订单数据
 */
/* 订单数据 预付费订单 */
INSERT INTO `order`(`customer_id`,`user_id`,`order_name`,`budget`,`order_type`,`contract_sn`,`start_date`,`end_date`,`order_desc`,`status`,`status_alter_corp`,`discount`) VALUES(2, 1, "测试订单-20160608_1814", 10000.0, 1, "20160608-bjjs-01", "2016-06-08", "2016-10-10", "测试用订单", 4, 2, 1.0);
/* 计划数据 */
INSERT INTO `order_plan`(`order_id`,`customer_id`,`user_id`,`plan_name`,`budget`, `day_budget`,`start_date`,`end_date`,`e_imps`,`e_audience`,`e_clicks`,`e_dayimps`,`e_dayclicks`,`e_cpm`,`e_cpc`,`e_a`,`deal_type`,`create_time`,`modify_time`,`status`,`state`) VALUES(1, 2, 1, "测试订单-20160608_1814_计划1", 2000.0, 1000.0, "2016-06-08", "2016-06-09", 100000, 1000, 100, 50000, 500, 1.6, 0.8, 50, 1, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), 4, 4);
/* 策略组：PC */
INSERT INTO `order_group`(`plan_id`,`order_id`,`customer_id`,`user_id`,`group_name`,`budget`, `day_budget`,`start_date`,`end_date`,`e_imps`,`e_audience`,`e_clicks`,`e_dayimps`,`e_dayclicks`,`e_cpm`,`e_cpc`,`e_a`,`e_ctr`,`user_dayimps`,`imp_smoothing`,`flow_type`,`create_time`,`modify_time`,`status`,`state`) VALUES(1, 1, 2, 1, "测试订单-20160608_1814_计划1_PC策略", 2000.0, 1000.0, "2016-06-08", "2016-06-09", 100000, 1000, 100, 50000, 50, 1.6, 0.8, 10, 0.01, 3, 1, 1, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), 4, 4);

/* 策略数据 */
INSERT INTO `order_strategy`(`group_id`,`data_type`,`data_name`,`data`) VALUES(1, "target", "adx", "BES"),(1, "target", "adx", "SOHU"),(1, "target", "crowdtags", "1,2,3"),(1, "target", "areas", "2b000000");

/* 广告数据: PC横幅、图片广告 */
INSERT INTO `order_ad`(`group_id`,`plan_id`,`order_id`,`customer_id`,`user_id`,`ad_name`,`ad_type`,`click_efficient`,`slot_type`,`status`) VALUES(1, 1, 1, 2,1, "测试-320x250-PC横幅", 2, 3, 1, 4)
/* 广告属性 */
INSERT INTO `ad_attr`(`ad_id`,`attr_name`,`attr`) VALUES(1,"width", "320"),(1,"height","250"),(1,"imgSrc", "http://127.0.0.1/ids/20160509/1.png"),(1,"desc", "宝马S400"),(1,"mime","image/png"),(1,"ext","png"),(1,"title","宝马S400");

/* 广告点击数据 */
INSERT INTO `ad_clickdata`(`ad_id`,`data_name`,`data`) VALUES(1, "siteUrl", "http://www.feillie.com");

/* 第三方监测*/
INSERT INTO `ad_3rd_tracker`(`ad_id`,`vendor_name`,`track_type`, `track_url`) VALUES(1, "nielsen", 1, "http://nielsen.com"),(1, "nielsen", 2, "http://nielsen.com");

/* DSP监测 */
INSERT INTO `dsp_admon`(`adx_id`,`track_type`, `track_url`) VALUES(0x10,1,"http://127.0.0.1/"),(0x10,2,"http://127.0.0.1/"),(0x1000, 1,"http://127.0.0.1/"),(0x1000,2,"http://127.0.0.1/");

/* 广告审核数据 */
INSERT INTO `ad_audit_data`(`ad_id`,`adx_id`, `status`,`audit_time`,`updated`,`update_time`) VALUES(1, 0x1000, 0, CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP()), (1, 0x10, 0, CURRENT_TIMESTAMP(), 1, CURRENT_TIMESTAMP());

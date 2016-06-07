
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


use dsp_adm_db;

INSERT INTO customer(corp_name,address,zipcode,site_name,website,icp_code,customer_type,corp_qualification_url,legal_person_id_url,phone,fax,logo,status,join_time) VALUES('宝马北京', '北京市朝阳区', '1000001', '宝马-北京', 'bj.baoma.com', '123x-334', 2, '', '', '010-66775567', '010-66775568', '', 4, CURRENT_TIMESTAMP());

/*
 * adx_id为搜狐的
 */
INSERT INTO customer_audit_data(customer_id,adx_id,status,audit_time,adx_ret) VALUES(1, 0x1000, 0, CURRENT_TIMESTAMP(), '', 1, CURRENT_TIMESTAMP());

<?php
	$server_root = $_SERVER['DOCUMENT_ROOT'];
	require_once($server_root . "/php_common/cf_loader.php");
	require_once($server_root . "/php_common/session.php");

	$role = 0;
	$uid = 0;
	$user_name = "未登录用户";
	if ($g_user_session->login_check() == true) {
		$user_name = $g_user_session->get_user_name();
		$role = $g_user_session->get_user_data('role');
		$uid = $g_user_session->get_user_data('uid');
	}

/*
 * 路由：/r.php?m=user&p=home
 *  或者：/r.php?m=user&a=add
 *  m表示模块；p表示页面；a表示action
 */
	if (!isset($_GET['m']) || (!isset($_GET['a']) && !isset($_GET['p']))) {
		header('Location: /index.php');
		exit(0);
	}
	if (isset($_GET['m'])) {
		$module = $_GET['m'];
	}
	$page = NULL;
	if (isset($_GET['p'])) {
		$page = $_GET['p'];
	}
	$action = NULL;
	if (isset($_GET['a'])) {
		$action = $_GET['a'];
	}

	if (NULL != $page) {
		$content_tpl_name = $server_root . '/' . $module . '/' . $page . '.php';
		include_once($server_root . '/tpls/logined_tpl.php');	
	} else if (NULL != $action) {
		$action_tpl_name = $server_root . '/' . $module . '/' . $action . '.php';
		require_once($action_tpl_name);
	}
?>

<?php

$sys_cf = null;

// 配置加载器
if(!function_exists('_load_config')){
      function _load_config() {
		$server_root = $_SERVER['DOCUMENT_ROOT'];
        $dir = $server_root . '/conf/';
        $dh = opendir($dir);
        $result = array();
        while (false!=($file = readdir($dh))){
            $ext = substr($file, -11,12);
            if($file!='.' && $file!='..' && $ext == '.config.php'){
                $result = array_merge($result,include ($dir.$file));
            }
        }
        closedir($dh);
        return $result;
      }
}

if (!function_exists('__C')) {
	function __c($conf_name) {
		if ($sys_cf == null) {
			return array();
		}

		if (!isset($sys_cf[$conf_name])) {
			return array();
		}

		return $sys_cf[$conf_name];
	}
}

if (null == $sys_cf) {
	$sys_cf = _load_config();
}

?>


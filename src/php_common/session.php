<?php

class Session {
	var $sid = "";
	var $redis = null;

	var $user_data = array();

	function Session() {
		$this->redis = $this->create_session_redis();	
	}

	function get_sid() {
		return $this->sid;
	}

	function create_session_redis() {
		$this->redis = new Redis();
		try {
			$ret = $this->redis->connect(SESSION_REDIS_SERVER, SESSION_REDIS_PORT, SESSION_REDIS_CONN_TIMEOUT);
			if ($ret != true) {
				return null;
			}
			$ret = $this->redis->select(SESSION_REDIS_DB);
			if ($ret != true) {
				return null;
			}
		} catch (Exception $e) {
			echo "Exception " . $e->getMessage() . "<br>";
		}
	
		return $this->redis;
	}

	function session_exist($sid) {
		$key = SESSION_REDIS_KEY_PREFIX. $sid;
	
		$s_data = $this->redis->hgetall($key);
		if ($s_data == null || count($s_data) <= 0) {
			return false;
		}
		$this->sid = $sid;

		//$this->redis->expireAt($key, time() + 10*60);
		$this->redis->expire($key, 10*60);

		$this->user_data['uid'] = $s_data['uid'];
		$this->user_data['email'] = $s_data['email'];
		$this->user_data['role'] = $s_data['role'];
		$this->user_data['role_level'] = $s_data['role_level'];
		$this->user_data['corp_id'] = $s_data['corp_id'];

		return true;
	}

	function update_data($user_id, $email, $role_id, $role_level, $corp_id) {
		$this->sid = sha1($user_id . $email. time());
		$key = SESSION_REDIS_KEY_PREFIX . $this->sid;

		$this->user_data['uid']= intval($user_id, 10);
		$this->user_data['email'] = $email;
		$this->user_data['role'] = intval($role_id, 10);
		$this->user_data['role_level'] = intval($role_level, 10);
		$this->user_data['corp_id'] = intval($corp_id, 10);
		if ($this->redis != null) {
			$this->redis->hmset($key, $this->user_data);
			$this->redis->expireAt($key, time() + 10*60);
		}
	}

	function get_user_data($k) {
		if (isset($this->user_data[$k])) {
			return $this->user_data[$k];
		}

		$key = SESSION_REDIS_KEY_PREFIX . $this->sid;
		$qry_fields = array();
		$qry_fields[] = $k;
		$qry_res = $this->redis->hmget($key, $qry_fields); 
		if (count($qry_res) > 0) {
			if ($k == "uid" || $k=="role" || $k=="role_level" || $k=="corp_id") {
				return intval($qry_res[$k], 10);
			} else {
				return $qry_res[$k];
			}
		}

		return "";
	}

	function login_check() {
		if (!isset($_COOKIE['sid'])) {
			return false;
		}

		if ($this->session_exist($_COOKIE["sid"]) == false) {
			setcookie("sid", $_COOKIE["sid"], time() - 24*3600, "/");
			return false;
		}

		// 10分钟后过期，在浏览器上出现的是国际时区....所以暂时不设置过期，由服务器端来控制
		setcookie("sid", $_COOKIE["sid"], time()+60*10, "/");
		return true;
	}

	function get_user_name() {
		$user_name = $this->get_user_data("email");
		$len = mb_strlen($user_name);
		// 控制长度30个字符
		if ($len >= 30) {
			$user_name = mb_substr($user_name, 0, 30);
		} else {
			for ($i = 0; $i < (30-$len); ++$i) {
				$user_name = "&nbsp;" . $user_name;
			}
		}

		return $user_name;
	}

	function leave($sid) {
		$key = SESSION_REDIS_KEY_PREFIX. $sid;
		if ($this->redis == null) {
			$this->redis = $this->create_session_redis();
		}
		if ($this->redis != null) {
			$this->redis->del($key);
		}

		return true;
	}
}

$g_user_session = new Session();

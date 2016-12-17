<?php
class ModelExtensionModuleLetMeKnow extends Model {
	public function addLetMeKnow(array $data) {


		$sql =  "INSERT INTO " . DB_PREFIX . "letmeknow SET
					product_id 		= '" . (int)$data['product_id'] . "',
					name 			= '" . $data['name'] . "',
					email 			= '" . $data['email'] . "',
					date_added  	= '" . date('Y-m-d H:i:s') . "',
					date_modified 	= '" . date('Y-m-d H:i:s') . "',
					language_id 	= '" . (int)$data['language_id'] . "',
					currency_id 	= '" . (int)$data['currency_id'] . "',
					ip 				= '" . $data['ip'] . "',
					forwarded_ip 	= '" . $data['forwarded_ip'] . "',
					send 			= '" . 0 . "'";
				


		$this->db->query($sql);

		$letmeknow_id = $this->db->getLastId();

		return $letmeknow_id;
	}
}
?>
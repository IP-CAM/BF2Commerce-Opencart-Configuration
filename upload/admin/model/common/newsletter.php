<?php
class ModelCommonNewsletter extends Model {
	
	public function createNewsletter()
	{
			
		$res0 = $this->db->query("SHOW TABLES LIKE '". DB_PREFIX ."newsletter'");
		if($res0->num_rows == 0){
			$this->db->query("
				CREATE TABLE IF NOT EXISTS `".DB_PREFIX."newsletter` (
				  `news_id` int(11) NOT NULL AUTO_INCREMENT,
				  `news_email` varchar(255) NOT NULL,
				  PRIMARY KEY (`news_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
			");
		}
		
		
	}
	
	public function getNewsLetter($data = array()) {
		$sql = "SELECT * FROM ". DB_PREFIX ."newsletter WHERE status = '1'";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql); 

		return $query->rows;
	}
	
	
	public function getTotalRegisterNewsLetters() {
		
		$sql = "SELECT count(*) as total FROM ". DB_PREFIX ."newsletter WHERE status = '1'";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql); 
		
		return $query->row['total'];
	}
}
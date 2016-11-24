<?php
class ModelPaymentCielow extends Model {
	public function install() {
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "order_cielow` (
			`order_cielow_id` INT(11) NOT NULL AUTO_INCREMENT,
			`order_id` INT(11) NULL,
			`tid` VARCHAR(30) NULL,
			`nsu` VARCHAR(20) NULL,
			`status` VARCHAR(3) NULL,
			`dataPedido` VARCHAR(30) NULL,
			`bandeira` VARCHAR(20) NULL,
			`produto` VARCHAR(2) NULL,
			`parcelas` VARCHAR(2) NULL,
			`autorizacaoCodigo` VARCHAR(2) NULL,
			`autorizacaoMensagem` VARCHAR(250) NULL,
			`autorizacaoData` VARCHAR(30) NULL,
			`autorizacaoValor` VARCHAR(20) NULL,
			`autorizacaoLR` VARCHAR(3) NULL,
			`autorizacaoNSU` VARCHAR(20) NULL,
			`capturaCodigo` VARCHAR(2) NULL,
			`capturaMensagem` VARCHAR(250) NULL,
			`capturaData` VARCHAR(30) NULL,
			`capturaValor` VARCHAR(20) NULL,
			`cancelaCodigo` VARCHAR(2) NULL,
			`cancelaMensagem` VARCHAR(250) NULL,
			`cancelaData` VARCHAR(30) NULL,
			`cancelaValor` VARCHAR(20) NULL,
			`xml` TEXT NULL,
			PRIMARY KEY (`order_cielow_id`) );
		");
	}

	public function updateTable() {
		$this->install();

		$fields = array(
					'order_cielow_id' => 'int(11)',
					'order_id' => 'int(11)',
					'tid' => 'varchar(30)',
					'nsu' => 'varchar(20)',
					'status' => 'varchar(3)',
					'dataPedido' => 'varchar(30)',
					'bandeira' => 'varchar(20)',
					'produto' => 'varchar(2)',
					'parcelas' => 'varchar(2)',
					'autorizacaoCodigo' => 'varchar(2)',
					'autorizacaoMensagem' => 'varchar(250)',
					'autorizacaoData' => 'varchar(30)',
					'autorizacaoValor' => 'varchar(20)',
					'autorizacaoLR' => 'varchar(3)',
					'autorizacaoNSU' => 'varchar(20)',
					'capturaCodigo' => 'varchar(2)',
					'capturaMensagem' => 'varchar(250)',
					'capturaData' => 'varchar(30)',
					'capturaValor' => 'varchar(20)',
					'cancelaCodigo' => 'varchar(2)',
					'cancelaMensagem' => 'varchar(250)',
					'cancelaData' => 'varchar(30)',
					'cancelaValor' => 'varchar(20)',
					'xml' => 'text'
				);

		$table = DB_PREFIX . "order_cielow";

		// Verifica quais colunas existem atualmente na tabela
		$field_query = $this->db->query("SHOW COLUMNS FROM `" . $table . "`");
		foreach ($field_query->rows as $field) {
			$field_data[$field['Field']] = $field['Type'];
		}

		// Remove colunas da tabela caso não existam na nova estrutura da tabela conforme $fields
		foreach ($field_data as $key => $value) {
			if (!array_key_exists($key, $fields)) {
				$this->db->query("ALTER TABLE `" . $table . "` DROP COLUMN `" . $key . "`");
			}
		}
		
		// Adiciona novas colunas na tabela caso não existam na nova estrutura da tabela conforme $fields
		$this->session->data['after_column'] = 'order_cielow_id';
		foreach ($fields as $key => $value) {
			if (!array_key_exists($key, $field_data)) {
				$this->db->query("ALTER TABLE `" . $table . "` ADD `" . $key . "` " . $value . " AFTER `" . $this->session->data['after_column'] . "`");
			}
			$this->session->data['after_column'] = $key;
		}
		unset($this->session->data['after_column']);

		// Altera o tipo de coluna na tabela caso o tipo tenha sido alterado conforme $fields
		foreach ($fields as $key => $value) {
			if ($key == 'order_cielow_id') {
				$this->db->query("ALTER TABLE `" . $table . "` CHANGE COLUMN `" . $key . "` `" . $key . "` " . $value . " NOT NULL AUTO_INCREMENT");
			} else {
				$this->db->query("ALTER TABLE `" . $table . "` CHANGE COLUMN `" . $key . "` `" . $key . "` " . $value);
			}		
		}
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "order_cielow`;");
	}

	public function getTransactions($data = array()) {
		$sql = "SELECT oc.order_id, oc.order_cielow_id, oc.dataPedido, CONCAT(o.firstname, ' ', o.lastname) as customer, oc.bandeira, oc.parcelas, oc.tid, oc.nsu, oc.autorizacaoData, oc.autorizacaoValor, oc.capturaData, oc.capturaValor, oc.cancelaData, oc.cancelaValor, oc.status FROM `" . DB_PREFIX . "order_cielow` oc INNER JOIN `" . DB_PREFIX . "order` o ON (o.order_id = oc.order_id) ";

		if (!empty($data['filter_order_id'])) {
			$sql .= " WHERE oc.order_id = '" . (int)$data['filter_order_id'] . "'";
		} else {
			$sql .= " WHERE oc.order_id > '0'";
		}

		if (!empty($data['filter_dataPedido'])) {
			$sql .= " AND STR_TO_DATE(oc.dataPedido,'%Y-%m-%d') = '" . $data['filter_dataPedido'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_tid'])) {
			$sql .= " AND oc.tid = '" . $this->db->escape($data['filter_tid']) . "'";
		}

		if (!empty($data['filter_nsu'])) {
			$sql .= " AND oc.nsu = '" . $this->db->escape($data['filter_nsu']) . "'";
		}

		if (!empty($data['filter_status'])) {
			$sql .= " AND oc.status = '" . $this->db->escape($data['filter_status']) . "'";
		}

		$sort_data = array(
			'oc.order_id',
			'oc.dataPedido',
			'customer',
			'oc.status'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY oc.order_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

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

    public function getTotalTransactions($data = array()) {
		$sql = "SELECT COUNT(DISTINCT oc.order_cielow_id) AS total FROM `" . DB_PREFIX . "order_cielow` oc INNER JOIN `" . DB_PREFIX . "order` o ON (o.order_id = oc.order_id) ";

		if (!empty($data['filter_order_id'])) {
			$sql .= " WHERE oc.order_id = '" . (int)$data['filter_order_id'] . "'";
		} else {
			$sql .= " WHERE oc.order_id > '0'";
		}

		if (!empty($data['filter_dataPedido'])) {
			$sql .= " AND STR_TO_DATE(oc.dataPedido,'%Y-%m-%d') = '" . $data['filter_dataPedido'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_tid'])) {
			$sql .= " AND oc.tid = '" . $this->db->escape($data['filter_tid']) . "'";
		}

		if (!empty($data['filter_nsu'])) {
			$sql .= " AND oc.nsu = '" . $this->db->escape($data['filter_nsu']) . "'";
		}

		if (!empty($data['filter_status'])) {
			$sql .= " AND oc.status = '" . $this->db->escape($data['filter_status']) . "'";
		}

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

	public function getOrder($data, $order_id) {
		$columns = implode(", ", array_values($data));

		$qry = $this->db->query("
			SELECT " . $columns . " 
			FROM `" . DB_PREFIX . "order` 
			WHERE `order_id` = '" . (int)$order_id . "'
		");

		if ($qry->num_rows) {
			return $qry->row;
		} else {
			return false;
		}
	}

	public function getTransaction($order_cielow_id) {
		$qry = $this->db->query("
			SELECT * 
			FROM `" . DB_PREFIX . "order_cielow` 
			WHERE `order_cielow_id` = '" . (int)$order_cielow_id . "'
		");

		if ($qry->num_rows) {
			return $qry->row;
		} else {
			return false;
		}
	}

	public function cancelTransaction($data) {
		$this->db->query("
			UPDATE " . DB_PREFIX . "order_cielow
			SET status = '" . $this->db->escape($data['status']) . "',
				cancelaCodigo = '" . $this->db->escape($data['cancelaCodigo']) . "',
				cancelaMensagem = '" . $this->db->escape($data['cancelaMensagem']) . "',
				cancelaData = '" . $this->db->escape($data['cancelaData']) . "',
				cancelaValor = '" . $this->db->escape($data['cancelaValor']) . "',
				xml = '" . $this->db->escape($data['xml']) . "'
			WHERE order_cielow_id = '" . (int)$data['order_cielow_id'] . "'
		");
	}

	public function captureTransaction($data) {
		$this->db->query("
			UPDATE " . DB_PREFIX . "order_cielow
			SET status = '" . $this->db->escape($data['status']) . "',
				capturaCodigo = '" . $this->db->escape($data['capturaCodigo']) . "',
				capturaMensagem = '" . $this->db->escape($data['capturaMensagem']) . "',
				capturaData = '" . $this->db->escape($data['capturaData']) . "',
				capturaValor = '" . $this->db->escape($data['capturaValor']) . "',
				xml = '" . $this->db->escape($data['xml']) . "'
			WHERE order_cielow_id = '" . (int)$data['order_cielow_id'] . "'
		");
	}

	public function deleteTransaction($order_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "order_cielow` WHERE order_id = '" . (int)$order_id . "'");
	}
}
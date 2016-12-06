<?php
class ModelReportProduct extends Model {
	public function getProductsViewed($data = array()) {
		$sql = "SELECT pd.name, p.model, p.viewed FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.viewed > 0 ORDER BY p.viewed DESC";

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

	public function getTotalProductViews() {
		$query = $this->db->query("SELECT SUM(viewed) AS total FROM " . DB_PREFIX . "product");

		return $query->row['total'];
	}

	public function getTotalProductsViewed() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE viewed > 0");

		return $query->row['total'];
	}

	public function reset() {
		$this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = '0'");
	}

	public function getPurchased($data = array()) {
		$sql = "SELECT op.name, op.model, SUM(op.quantity) AS quantity, SUM(op.price + (op.tax * op.quantity)) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " GROUP BY op.product_id ORDER BY total DESC";

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

	public function getRequested($data = array()) {
		$sql = "
		SELECT 
			DISTINCT(lk.product_id),
			pd.name as product_name, 
			p.model as product_model,
			(SELECT count(*) as total FROM " . DB_PREFIX . "letmeknow as let WHERE let.product_id = lk.product_id) as product_quantity,
			lk.send as product_notified

		FROM " . DB_PREFIX . "letmeknow as lk
		INNER JOIN `" . DB_PREFIX . "product` p ON (lk.product_id = p.product_id)
		INNER JOIN `" . DB_PREFIX . "product_description` pd ON (p.product_id = pd.product_id)

        WHERE p.status = 1
		";


		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model = '" . $data['filter_model'] . "'";
		}	

		if (!empty($data['filter_quantity'])) {
			$sql .= " AND (SELECT count(*) as total FROM " . DB_PREFIX . "letmeknow as let WHERE let.product_id = lk.product_id) >= '" . $data['filter_quantity'] . "'";
		}	


		if (!empty($data['filter_product'])) {
			$sql .= " AND pd.name = '" . $data['filter_product'] . "'";
		}


		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(lk.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(lk.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}


		$sql .= " GROUP BY lk.product_id ORDER BY product_quantity DESC";


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


	public function getTotalPurchased($data) {
		$sql = "SELECT COUNT(DISTINCT op.product_id) AS total FROM `" . DB_PREFIX . "order_product` op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalRequested($data) {

		$sql = "
		SELECT 
			COUNT( DISTINCT(lk.product_id) ) AS total

		FROM " . DB_PREFIX . "letmeknow as lk
		INNER JOIN `" . DB_PREFIX . "product` p ON (lk.product_id = p.product_id)
		INNER JOIN `" . DB_PREFIX . "product_description` pd ON (p.product_id = pd.product_id)

        WHERE p.status = 1
		";


		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model = '" . $data['filter_model'] . "'";
		}	



		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name = '" . $data['filter_name'] . "'";
		}


		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(lk.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(lk.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}

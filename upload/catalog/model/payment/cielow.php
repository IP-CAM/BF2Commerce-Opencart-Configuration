<?php
class ModelPaymentCielow extends Model {
	public function getMethod($address, $total) {
		$this->load->language('payment/cielow');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('cielow_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if ($this->config->get('cielow_total') > 0 && $this->config->get('cielow_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('cielow_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$currencies = array(
			'BRL'
		);

		if (version_compare(VERSION, '2.2') < 0) {
			$currency_code = $this->currency->getCode();
		} else {
			$currency_code = $this->session->data['currency'];
		}

		if (!in_array(strtoupper($currency_code), $currencies)) {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			if (strlen(trim($this->config->get('cielow_imagem'))) > 0) {
				$title = '<img src="'.HTTPS_SERVER.'image/'.$this->config->get('cielow_imagem').'" alt="'.$this->config->get('cielow_titulo').'" title="'.$this->config->get('cielow_titulo').'" />';
			} else {
				$title = $this->config->get('cielow_titulo');
			}

      		$method_data = array( 
        		'code'       => 'cielow',
        		'title'      => $title,
				'terms'      => '',
				'sort_order' => $this->config->get('cielow_sort_order')
      		);
    	}

		return $method_data;
	}

	public function addOrder($data) {
		$columns = implode(", ", array_keys($data));
		$values  = "'".implode("', '", array_values($data))."'";
		$this->db->query("INSERT INTO `" . DB_PREFIX . "order_cielow` ($columns) VALUES ($values)");
	}
}
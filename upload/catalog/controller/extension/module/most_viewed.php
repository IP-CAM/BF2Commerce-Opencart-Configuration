<?php
class ControllerExtensionModuleMostViewed extends Controller {
	
	/*
	Receber as configurações da plataforma
	*/
	public function index($setting) {
		
		/*
		Carrega a lingua
		*/
		$this->load->language('extension/module/most_viewed');

		/* 
		Carrega os textos
		*/
		//titulo
		$data['heading_title'] = $this->language->get('heading_title');
		//imposto
		$data['text_tax'] = $this->language->get('text_tax');
		//botoes
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		
		/*
		Carrega o model de imagem (recorte, redimensionar)
		*/
		$this->load->model('tool/image');

		
		/*
		Carrega o model de produtos
		*/
		$this->load->model('catalog/product');

		/*
		Monta a lista de produtos que será impresso no catalog
		*/
		$data['products'] = array();
		//busca os produtos de acordo com as regras
		
		$results = $this->model_catalog_product->getMostViewedProducts($setting['limit']);

		//se tem produtos
		if ($results) {
			
			foreach ($results as $result) {
				//imagem
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}
				
				/*
				Identifica o usuario para identificar qual é o preço adequado
				*/
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				//preço promocial
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				//imposto
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				//avaliações de clientes
				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				//monta a lista que sera impressa
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			//retorna o resutado
			return $this->load->view('extension/module/most_viewed', $data);
		}
	}
}

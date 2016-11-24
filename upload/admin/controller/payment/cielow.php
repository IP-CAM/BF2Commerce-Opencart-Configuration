<?php
class ControllerPaymentCielow extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/cielow');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cielow', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

            if (isset($this->request->post['save_stay']) && ($this->request->post['save_stay'] = 1)) {
				$this->response->redirect($this->url->link('payment/cielow', 'token=' . $this->session->data['token'], true));
			} else {
				$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], true));
			}
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_manual'] = $this->language->get('text_manual');
		$data['text_automatica'] = $this->language->get('text_automatica');
		$data['text_operadora'] = $this->language->get('text_operadora');
		$data['text_loja'] = $this->language->get('text_loja');
		$data['text_simples'] = $this->language->get('text_simples');
		$data['text_composto'] = $this->language->get('text_composto');
		$data['text_ativar'] = $this->language->get('text_ativar');
		$data['text_parcelas'] = $this->language->get('text_parcelas');
		$data['text_sem_juros'] = $this->language->get('text_sem_juros');
		$data['text_juros'] = $this->language->get('text_juros');
		$data['text_homologacao'] = $this->language->get('text_homologacao');
		$data['text_producao'] = $this->language->get('text_producao');
		$data['text_campo'] = $this->language->get('text_campo');
		$data['text_nao_personalizado'] = $this->language->get('text_nao_personalizado');
		$data['text_razao'] = $this->language->get('text_razao');
		$data['text_cnpj'] = $this->language->get('text_cnpj');
		$data['text_cpf'] = $this->language->get('text_cpf');
		$data['text_numero_fatura'] = $this->language->get('text_numero_fatura');
		$data['text_numero_entrega'] = $this->language->get('text_numero_entrega');
		$data['text_complemento_fatura'] = $this->language->get('text_complemento_fatura');
		$data['text_complemento_entrega'] = $this->language->get('text_complemento_entrega');
		$data['text_skeleton'] = $this->language->get('text_skeleton');
		$data['text_bootstrap'] = $this->language->get('text_bootstrap');

		$data['tab_geral'] = $this->language->get('tab_geral');
		$data['tab_api'] = $this->language->get('tab_api');
		$data['tab_parcelamentos'] = $this->language->get('tab_parcelamentos');
		$data['tab_situacoes_pedido'] = $this->language->get('tab_situacoes_pedido');
		$data['tab_finalizacao'] = $this->language->get('tab_finalizacao');
		$data['tab_campos'] = $this->language->get('tab_campos');
		$data['tab_clearsale'] = $this->language->get('tab_clearsale');
		$data['tab_fcontrol'] = $this->language->get('tab_fcontrol');

		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_credenciamento'] = $this->language->get('entry_credenciamento');
		$data['entry_chave'] = $this->language->get('entry_chave');
		$data['entry_soft_descriptor'] = $this->language->get('entry_soft_descriptor');
		$data['entry_ambiente'] = $this->language->get('entry_ambiente');
		$data['entry_captura'] = $this->language->get('entry_captura');
		$data['entry_calculo'] = $this->language->get('entry_calculo');
		$data['entry_minimo'] = $this->language->get('entry_minimo');
		$data['entry_visa'] = $this->language->get('entry_visa');
		$data['entry_mastercard'] = $this->language->get('entry_mastercard');
		$data['entry_diners'] = $this->language->get('entry_diners');
		$data['entry_discover'] = $this->language->get('entry_discover');
		$data['entry_elo'] = $this->language->get('entry_elo');
		$data['entry_amex'] = $this->language->get('entry_amex');
		$data['entry_jcb'] = $this->language->get('entry_jcb');
		$data['entry_aura'] = $this->language->get('entry_aura');
		$data['entry_situacao_pendente'] = $this->language->get('entry_situacao_pendente');
		$data['entry_situacao_autorizada'] = $this->language->get('entry_situacao_autorizada');
		$data['entry_situacao_nao_autorizada'] = $this->language->get('entry_situacao_nao_autorizada');
		$data['entry_situacao_capturada'] = $this->language->get('entry_situacao_capturada');
		$data['entry_situacao_cancelada'] = $this->language->get('entry_situacao_cancelada');
		$data['entry_titulo'] = $this->language->get('entry_titulo');
		$data['entry_imagem'] = $this->language->get('entry_imagem');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_custom_razao_id'] = $this->language->get('entry_custom_razao_id');
		$data['entry_custom_cnpj_id'] = $this->language->get('entry_custom_cnpj_id');
		$data['entry_custom_cpf_id'] = $this->language->get('entry_custom_cpf_id');
		$data['entry_custom_numero_id'] = $this->language->get('entry_custom_numero_id');
		$data['entry_custom_complemento_id'] = $this->language->get('entry_custom_complemento_id');
		$data['entry_clearsale_codigo'] = $this->language->get('entry_clearsale_codigo');
		$data['entry_clearsale_ambiente'] = $this->language->get('entry_clearsale_ambiente');
		$data['entry_clearsale_status'] = $this->language->get('entry_clearsale_status');
		$data['entry_fcontrol_login'] = $this->language->get('entry_fcontrol_login');
		$data['entry_fcontrol_senha'] = $this->language->get('entry_fcontrol_senha');
		$data['entry_fcontrol_status'] = $this->language->get('entry_fcontrol_status');

		$data['help_total'] = $this->language->get('help_total');
		$data['help_credenciamento'] = $this->language->get('help_credenciamento');
		$data['help_chave'] = $this->language->get('help_chave');
		$data['help_soft_descriptor'] = $this->language->get('help_soft_descriptor');
		$data['help_antifraude'] = $this->language->get('help_antifraude');
		$data['help_ambiente'] = $this->language->get('help_ambiente');
		$data['help_captura'] = $this->language->get('help_captura');
		$data['help_calculo'] = $this->language->get('help_calculo');
		$data['help_minimo'] = $this->language->get('help_minimo');
		$data['help_visa'] = $this->language->get('help_visa');
		$data['help_mastercard'] = $this->language->get('help_mastercard');
		$data['help_diners'] = $this->language->get('help_diners');
		$data['help_discover'] = $this->language->get('help_discover');
		$data['help_elo'] = $this->language->get('help_elo');
		$data['help_amex'] = $this->language->get('help_amex');
		$data['help_jcb'] = $this->language->get('help_jcb');
		$data['help_aura'] = $this->language->get('help_aura');
		$data['help_situacao_pendente'] = $this->language->get('help_situacao_pendente');
		$data['help_situacao_autorizada'] = $this->language->get('help_situacao_autorizada');
		$data['help_situacao_nao_autorizada'] = $this->language->get('help_situacao_nao_autorizada');
		$data['help_situacao_capturada'] = $this->language->get('help_situacao_capturada');
		$data['help_situacao_cancelada'] = $this->language->get('help_situacao_cancelada');
		$data['help_titulo'] = $this->language->get('help_titulo');
		$data['help_imagem'] = $this->language->get('help_imagem');
		$data['help_layout'] = $this->language->get('help_layout');
		$data['help_custom_razao_id'] = $this->language->get('help_custom_razao_id');
		$data['help_custom_cnpj_id'] = $this->language->get('help_custom_cnpj_id');
		$data['help_custom_cpf_id'] = $this->language->get('help_custom_cpf_id');
		$data['help_custom_numero_id'] = $this->language->get('help_custom_numero_id');
		$data['help_custom_complemento_id'] = $this->language->get('help_custom_complemento_id');
		$data['help_campo'] = $this->language->get('help_campo');
		$data['help_razao'] = $this->language->get('help_razao');
		$data['help_cnpj'] = $this->language->get('help_cnpj');
		$data['help_cpf'] = $this->language->get('help_cpf');
		$data['help_numero_fatura'] = $this->language->get('help_numero_fatura');
		$data['help_numero_entrega'] = $this->language->get('help_numero_entrega');
		$data['help_complemento_fatura'] = $this->language->get('help_complemento_fatura');
		$data['help_complemento_entrega'] = $this->language->get('help_complemento_entrega');
		$data['help_clearsale_codigo'] = $this->language->get('help_clearsale_codigo');
		$data['help_fcontrol_login'] = $this->language->get('help_fcontrol_login');
		$data['help_fcontrol_senha'] = $this->language->get('help_fcontrol_senha');

		$data['button_save_stay'] = $this->language->get('button_save_stay');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['token'] = $this->session->data['token'];

		$erros = array(
			'warning',
			'titulo',
			'credenciamento',
			'chave',
			'soft_descriptor',
			'clearsale_codigo',
			'fcontrol_login',
			'fcontrol_senha'
		);

		foreach ($erros as $erro) {
			if (isset($this->error[$erro])) {
				$data['error_'.$erro] = $this->error[$erro];
			} else {
				$data['error_'.$erro] = '';
			}
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], true),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/cielow', 'token=' . $this->session->data['token'], true),
      		'separator' => ' :: '
   		);

		$data['action'] = $this->url->link('payment/cielow', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], true);

		$data['versao'] = '2.14';

		$campos = array(
			'total' => '',
			'lojas' => array(0),
			'geo_zone_id' => '',
			'status' => '',
			'sort_order' => '',
			'credenciamento' => '',
			'chave' => '',
			'soft_descriptor' => '',
			'ambiente' => '',
			'captura' => '',
			'calculo' => '',
			'minimo' => '',
			'visa' => '',
			'visa_parcelas' => '',
			'visa_sem_juros' => '',
			'visa_juros' => '',
			'mastercard' => '',
			'mastercard_parcelas' => '',
			'mastercard_sem_juros' => '',
			'mastercard_juros' => '',
			'diners' => '',
			'diners_parcelas' => '',
			'diners_sem_juros' => '',
			'diners_juros' => '',
			'discover' => '',
			'elo' => '',
			'elo_parcelas' => '',
			'elo_sem_juros' => '',
			'elo_juros' => '',
			'amex' => '',
			'amex_parcelas' => '',
			'amex_sem_juros' => '',
			'amex_juros' => '',
			'jcb' => '',
			'jcb_parcelas' => '',
			'jcb_sem_juros' => '',
			'jcb_juros' => '',
			'aura' => '',
			'aura_parcelas' => '',
			'aura_sem_juros' => '',
			'aura_juros' => '',
			'situacao_pendente_id' => '',
			'situacao_autorizada_id' => '',
			'situacao_nao_autorizada_id' => '',
			'situacao_capturada_id' => '',
			'situacao_cancelada_id' => '',
			'titulo' => '',
			'imagem' => '',
			'layout' => '',
			'custom_razao_id' => '',
			'razao_coluna' => '',
			'custom_cnpj_id' => '',
			'cnpj_coluna' => '',
			'custom_cpf_id' => '',
			'cpf_coluna' => '',
			'custom_numero_id' => '',
			'numero_fatura_coluna' => '',
			'numero_entrega_coluna' => '',
			'custom_complemento_id' => '',
			'complemento_fatura_coluna' => '',
			'complemento_entrega_coluna' => '',
			'clearsale_codigo' => '',
			'clearsale_ambiente' => '',
			'clearsale_status' => '',
			'fcontrol_login' => '',
			'fcontrol_senha' => '',
			'fcontrol_status' => ''
		);

		foreach ($campos as $campo => $valor) {
			if (!empty($valor)) {
				if (isset($this->request->post['cielow_'.$campo])) {
					$data['cielow_'.$campo] = $this->request->post['cielow_'.$campo];
				} else if ($this->config->get('cielow_'.$campo)) {
					$data['cielow_'.$campo] = $this->config->get('cielow_'.$campo);
				} else {
					$data['cielow_'.$campo] = $valor;
				}
			} else {
				if (isset($this->request->post['cielow_'.$campo])) {
					$data['cielow_'.$campo] = $this->request->post['cielow_'.$campo];
				} else {
					$data['cielow_'.$campo] = $this->config->get('cielow_'.$campo);
				}
			}
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();		

		$this->load->model('tool/image');

		if (isset($this->request->post['cielow_imagem']) && is_file(DIR_IMAGE . $this->request->post['cielow_imagem'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['cielow_imagem'], 100, 100);
		} elseif (is_file(DIR_IMAGE . $this->config->get('cielow_imagem'))) {
			$data['thumb'] = $this->model_tool_image->resize($this->config->get('cielow_imagem'), 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['no_image'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$data['custom_fields'] = array();

		if (version_compare(VERSION, '2.1') < 0) {
			$this->load->model('sale/custom_field');

			$custom_fields = $this->model_sale_custom_field->getCustomFields();
		} else {
			$this->load->model('customer/custom_field');

			$custom_fields = $this->model_customer_custom_field->getCustomFields();
		}

		foreach ($custom_fields as $custom_field) {
			$data['custom_fields'][] = array(
				'custom_field_id'    => $custom_field['custom_field_id'],
				'name'               => $custom_field['name'],
				'type'               => $custom_field['type'],
				'location'           => $custom_field['location']
			);
		}

		for ($i = 1; $i <= 12; $i++) {
			$data['parcelas'][] = $i;
		}

		$this->load->model('payment/cielow');
		$this->model_payment_cielow->updateTable();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/cielow.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/cielow')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$erros = array(
			'credenciamento',
			'chave',
			'soft_descriptor',
			'titulo'
		);

		foreach ($erros as $erro) {
			if (!(trim($this->request->post['cielow_'.$erro]))) {
				$this->error[$erro] = $this->language->get('error_'.$erro);
			}
		}

		if ($this->request->post['cielow_clearsale_status']) {
			if (!$this->request->post['cielow_clearsale_codigo']) {
				$this->error['clearsale_codigo'] = $this->language->get('error_clearsale_codigo');
			}
		}

		if ($this->request->post['cielow_fcontrol_status']) {
			if (!$this->request->post['cielow_fcontrol_login']) {
				$this->error['fcontrol_login'] = $this->language->get('error_fcontrol_login');
			}

			if (!$this->request->post['cielow_fcontrol_senha']) {
				$this->error['fcontrol_senha'] = $this->language->get('error_fcontrol_senha');
			}
		}

		return !$this->error;
	}

	public function install() {
		$this->load->model('payment/cielow');
		$this->model_payment_cielow->install();

		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sale/cielow_search');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'sale/cielow_search');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'sale/cielow_error_log');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'sale/cielow_error_log');

		$this->load->model('extension/event');

		if (version_compare(VERSION, '2.2') < 0) {
			$this->model_extension_event->addEvent('cielow', 'post.order.delete', 'payment/cielow/on_order_delete');
		} else {
			$this->model_extension_event->addEvent('cielow', 'catalog/model/checkout/order/deleteOrder/after', 'payment/cielow/on_order_delete');
		}
	}

	public function uninstall() {
		$this->load->model('payment/cielow');
		$this->model_payment_cielow->uninstall();

		$this->load->model('user/user_group');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sale/cielow_search');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'sale/cielow_search');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'sale/cielow_error_log');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'sale/cielow_error_log');

		$this->load->model('extension/event');
		$this->model_extension_event->deleteEvent('cielow');
	}

	public function on_order_delete($order_id) {
		$this->load->model('payment/cielow');
		$this->model_payment_cielow->deleteTransaction($order_id);
	}
}
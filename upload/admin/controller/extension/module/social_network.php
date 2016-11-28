<?php
class ControllerExtensionModuleSocialNetwork extends Controller {
	private $error = array();

	public function index() {
		/*
		Carrega lingua
		*/
		$this->load->language('extension/module/social_network');

		/*
		Define titulo da pagina (title)
		*/
		$this->document->setTitle($this->language->get('heading_title'));

		/*
		carrega model de extensões
		*/
		$this->load->model('extension/module');

		/*
		Quando submit uma extensão + validacao dos campos
		*/
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			/*
			Identifica se o modulo já possui uma configuração
			*/
			if (!isset($this->request->get['module_id'])) {
				/*
				vai adicionar a configuração para o modulo
				*/
				$this->model_extension_module->addModule('social_network', $this->request->post);
			} else {
				/*
				vai editar uma configuração  já existente
				*/
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			/*
				limpa o cache de produtos
			*/
			$this->cache->delete('product');

			/*
			mensagem do resultado
			*/
			$this->session->data['success'] = $this->language->get('text_success');

			/*
			redireciona para a lista de modulos
			*/
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		
		/*
		Carrega as traduções do corpo da pagina
		*/
		//titulo
		$data['heading_title'] = $this->language->get('heading_title');
		//subtitulo
		$data['text_edit'] = $this->language->get('text_edit');
		//texto de campo select
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_follow'] = $this->language->get('text_follow');
		$data['text_share'] = $this->language->get('text_share');
		$data['text_related'] = $this->language->get('text_related');
		//texto de campos
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_tool'] = $this->language->get('entry_tool');
		$data['entry_id_addthis'] = $this->language->get('entry_id_addthis');
		$data['help_id_addthis'] = $this->language->get('help_id_addthis');

		//botoes de ação
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		/*
		Obtem as mensagens de erro
		*/
		//falta de permissão de modificação
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		//menos de 3 caracteres ou mais de 64
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['addthis'])) {
			$data['error_addthis'] = $this->error['addthis'];
		} else {
			$data['error_addthis'] = '';
		}



		/*
		breadcrumbs > caminho de pão
		*/
		$data['breadcrumbs'] = array();
		//pagina inicial
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		//pagina de extensoes
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			//Criar modulo
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/social_network', 'token=' . $this->session->data['token'], true)
			);
		} else {
			//editar modulo
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/social_network', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		/*
		Ações
		*/
		//Ação que deve ser realizada
		if (!isset($this->request->get['module_id'])) {
			//criar modulo (Quando submetido vai identificar que não tem variavel module_id)
			$data['action'] = $this->url->link('extension/module/social_network', 'token=' . $this->session->data['token'], true);
		} else {
			//editar o modulo pois vai ter o module_id
			$data['action'] = $this->url->link('extension/module/social_network', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		//cancelar para onde vai
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		
		
		/*
			Busca os dados do modulo
		*/
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			//busca os dados do modulo
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		//carregar os campos
		//campo nome
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['addthis'])) {
			$data['addthis'] = $this->request->post['addthis'];
		} elseif (!empty($module_info)) {
			$data['addthis'] = $module_info['addthis'];
		} else {
			$data['addthis'] = '';
		}
		
		if (isset($this->request->post['tool'])) {
			$data['tool'] = $this->request->post['tool'];
		} elseif (!empty($module_info)) {
			$data['tool'] = $module_info['tool'];
		} else {
			$data['tool'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		/*
		Carrega os componentes de tela
		*/
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		//monta tela e retorna para o usuário
		$this->response->setOutput($this->load->view('extension/module/social_network', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/social_network')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if (!$this->request->post['addthis']) {
			$this->error['addthis'] = $this->language->get('error_addthis');
		}

		if (!$this->request->post['tool']) {
			$this->error['tool'] = $this->language->get('error_tool');
		}

		if (!$this->request->post['status']) {
			$this->error['status'] = $this->language->get('error_status');
		}

		return !$this->error;
	}
}

<?php
class ControllerExtensionModuleLetmeknow extends Controller {
	public function index() {
		$this->load->language('extension/module/letmeknow');

		// SE POST
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$dataLetmeKnow = array();

			$dataLetmeKnow['name'] = $this->input->post('name');
			$dataLetmeKnow['email'] = $this->input->post('email');
			$dataLetmeKnow['product_id'] = $this->input->post('product_id');

			$dataLetmeKnow['language_id'] = $this->config->get('config_language_id');
			$dataLetmeKnow['currency_id'] = $this->currency->getId($this->session->data['currency']);
			
			$dataLetmeKnow['ip'] = $this->request->server['REMOTE_ADDR'];

			if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
				$dataLetmeKnow['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
			} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
				$dataLetmeKnow['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
			} else {
				$dataLetmeKnow['forwarded_ip'] = '';
			}


			
			//LOAD MODEL
			$this->load->model('model/extension/module/letmeknow');

			//EXECUTE FUNCTION
			$this->model_extension_module_letmeknow->addLetMeKnow($dataLetmeKnow);
			

			//TUDO CERTO?
			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}
		}

		//MENSAGENS DE ERRO
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}


		//CAPTURA DE DADOS JÁ INFOMADOS
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];		
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['product_id'])) {
			$data['product_id'] = $this->request->post['emaproduct_idil'];		
		} else {
			$data['product_id'] = '';
		}




		$data['heading_title'] = $this->language->get('heading_title');
		$data['letmeknow'] = 'OI';

		$this->response->setOutput($this->load->view('extension/module/letmeknow', $data));
	}


	protected function validateForm() {
	
		if ((utf8_strlen($this->request->post['name']) < 2) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if ((utf8_strlen($this->request->post['email']) < 2) || (utf8_strlen($this->request->post['email']) > 64)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['product_id']) < 2) || (utf8_strlen($this->request->post['product_id']) > 64)) {
			$this->error['product_id'] = $this->language->get('error_product_id');
		}

		return !$this->error;
	}

}


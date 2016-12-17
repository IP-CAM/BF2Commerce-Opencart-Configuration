<?php
class ControllerExtensionModuleNewsletters extends Controller {
	public function index() {
		$this->load->language('extension/module/newsletter');

		$this->load->model('extension/module/newsletters');

		
		$this->model_extension_module_newsletters->createNewsletter();


		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_brands'] = $this->language->get('text_brands');
		$data['text_index'] = $this->language->get('text_index');
		
		
		$data['txtErrorName'] = $this->language->get('txtErrorName');
		$data['txtErrorMail'] = $this->language->get('txtErrorMail');
		$data['txtErrorMailInvalid'] = $this->language->get('txtErrorMailInvalid');
		$data['txtEmail'] = $this->language->get('txtEmail');
		$data['txtName'] = $this->language->get('txtName');
		
		
		$data['btnNewsletter'] = $this->language->get('btnNewsletter');
		
		$data['brands'] = array();
		
		
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/extension/module/newsletters.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/extension/module/newsletters.tpl', $data);
		} else {
			return $this->load->view('extension/module/newsletters.tpl', $data);
		}
	}
	public function news()
	{

		$this->load->model('extension/module/newsletters');

		
		$json = array();
		$json['message'] = $this->model_extension_module_newsletters->subscribes($this->request->post);

		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
}

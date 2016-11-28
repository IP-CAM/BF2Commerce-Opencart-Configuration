<?php
class ControllerExtensionModuleSocialNetwork extends Controller {
	public function index($setting_info) {
		//$this->load->model('extension/module');
		//$setting_info = $this->model_extension_module->getModule(36);

		if ($setting_info && $setting_info['status']) {
			
			$this->load->language('extension/module/social_network');
			$this->document->addScript('http://s7.addthis.com/js/300/addthis_widget.js#pubid='.$setting_info['addthis']);
			
			$data['heading_title'] = $setting_info['name'];
			$data['social_network'] = $setting_info['tool'];
			
			return $this->load->view('extension/module/social_network', $data);
		}
	}
}

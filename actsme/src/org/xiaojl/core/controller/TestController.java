package org.xiaojl.core.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/testController")
public class TestController extends BaseController {
	private Log log = LogFactory.getLog(this.getClass());
	
	@RequestMapping("/testpage")
	public String go2TestPage(){
		log.debug("111111111111111111");
		return "test/test";
	}
	
	
}

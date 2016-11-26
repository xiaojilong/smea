package org.xiaojl.commons.jspTags;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xiaojl.commons.interceptor.PermissionInterceptor;
import org.xiaojl.commons.utils.FrameConstants;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.model.Resource;
import org.xiaojl.core.model.result.SessionUser;

/**
 * @Description: 根据url判断权限标签
 * 
 * 	在jsp中使用形式：
 * 		1、引入：
 * 			<%@ taglib prefix="fst" uri="/WEB-INF/tlds/frameSecurityTag.tld" %>
 * 		2、使用：
 * 			<fst:frameSecurity link="abc.do">
		    	<div>tttttttttttttttttest</div>
		    </fst:frameSecurity>
 */
public class FrameSecurityTag extends BodyTagSupport {
	private static final long serialVersionUID = 1405275582175006376L;
	private Log log = LogFactory.getLog(getClass());
	private String link;//  acApplication/forMain.do
	
	@Override
    public int doStartTag() throws JspException { // 在标签开始处出发该方法
        HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
        //判断是否有权限访问
        if (this.isOperCanAccess(request, link)) {
            //允许访问标签body
            return BodyTagSupport.EVAL_BODY_INCLUDE;// 返回此则执行标签body中内容，SKIP_BODY则不执行
        } else {
            return BodyTagSupport.SKIP_BODY;
        }

    }
	
	/**
	 * 判断是否具有访问link地址的权限
	 * @param request
	 * @param link
	 * @return
	 */
	private boolean isOperCanAccess(HttpServletRequest request, String link) {
		log.debug("link地址:"+link);
		SessionUser sUser = (SessionUser) request.getSession().getAttribute(FrameConstants.SESSION_USER);
		List<Resource> resources = sUser.getResources();
		log.debug(resources);
		if(resources!=null){
			for(Resource r:resources){
				if(!StringUtils.isBlank(r.getUrl())){
					if(r.getUrl().equals(link)){
						return true;
					}
				}
			}
		}
		return false;
	}

    @Override
    public int doEndTag() throws JspException {
        return BodyTagSupport.EVAL_BODY_INCLUDE;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}

package org.xiaojl.commons.scan;

import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.xiaojl.commons.utils.FrameConstants;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.model.SysLog;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.core.service.SysLogService;

/**
 * @description：AOP 日志
 */
//声明这是一个组件
@Component
//声明这是一个切面Bean
@Aspect
public class SysLogAspect {
    private Log log = LogFactory.getLog(SysLogAspect.class);
    
    @Autowired
    private SysLogService sysLogService;

    //配置切入点,该方法无方法体,主要为方便同类中其他方法使用此处配置的切入点
    @Pointcut("within(@org.springframework.stereotype.Controller *)")
    private void cutController() {}
    
    /**
     *  前置通知（Before advice）：在某连接点（JoinPoint）之前执行的通知，但这个通知不能阻止连接点前的执行。ApplicationContext中在<aop:aspect>里面使用<aop:before>元素进行声明。例如，TestAspect中的doBefore方法。
		后置通知（After advice）：当某连接点退出的时候执行的通知（不论是正常返回还是异常退出）。ApplicationContext中在<aop:aspect>里面使用<aop:after>元素进行声明。例如，ServiceAspect中的returnAfter方法，所以Teser中调用UserService.delete抛出异常时，returnAfter方法仍然执行。
		返回后通知（After return advice）：在某连接点正常完成后执行的通知，不包括抛出异常的情况。ApplicationContext中在<aop:aspect>里面使用<after-returning>元素进行声明。
		环绕通知（Around advice）：包围一个连接点的通知，类似Web中Servlet规范中的Filter的doFilter方法。可以在方法的调用前后完成自定义的行为，也可以选择不执行。ApplicationContext中在<aop:aspect>里面使用<aop:around>元素进行声明。例如，ServiceAspect中的around方法。
		抛出异常后通知（After throwing advice）：在方法抛出异常退出时执行的通知。ApplicationContext中在<aop:aspect>里面使用<aop:after-throwing>元素进行声明。例如，ServiceAspect中的returnThrow方法。
     */
    @Around("cutController()")
    public Object recordSysLog(ProceedingJoinPoint point) throws Throwable {
    	log.debug("系统日志AOP");
    	try{
    		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        	//请求URL
            String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
        	//方法名
            String strMethodName = point.getSignature().getName();
            //类名
            String strClassName = point.getTarget().getClass().getName();
            //参数
            Object[] params = point.getArgs();
            StringBuffer bfParams = new StringBuffer();
            Enumeration<String> paraNames = null;
            if (params != null && params.length > 0) {
                paraNames = request.getParameterNames();
                String key;
                String value;
                while (paraNames.hasMoreElements()) {
                    key = paraNames.nextElement();
                    value = request.getParameter(key);
                    bfParams.append(key).append("=").append(value).append("&");
                }
                if (StringUtils.isBlank(bfParams)) {
                    bfParams.append(request.getQueryString());
                }
            }
            requestUrl = requestUrl.replaceAll("/", "-");
            String strMessage = String.format("[请求地址]:%s,[类名]:%s,[方法]:%s,[参数]:%s", requestUrl,strClassName, strMethodName, bfParams.toString());
            log.debug(strMessage);
            if (isWriteLog(strMethodName)) {
            	String loginName = "匿名用户";
            	String roleName = "匿名用户";
            	SessionUser suser = (SessionUser) request.getSession().getAttribute(FrameConstants.SESSION_USER);
            	if(suser!=null){
            		loginName = suser.getLoginName();
            		roleName = suser.getName();
            	}
            	
            	SysLog sysLog = new SysLog();
                sysLog.setLoginName(loginName);
                sysLog.setRoleName(roleName);
                sysLog.setOptContent(strMessage);
                sysLog.setCreateTime(new Date());
                sysLog.setClientIp(request.getRemoteAddr());
//                log.info(sysLog.toString());
                //入库
               	sysLogService.insert(sysLog);
            	
            }else{
            	log.debug("非关键系统日志，不写入数据库！");
            }
    	} catch (Exception e) {
        	log.error("系统日志AOP出现异常!",e);
        }
    	
        return point.proceed();
    }

    private boolean isWriteLog(String method) {
        String[] pattern = {"login", "logout", "add", "edit", "delete", "grant"};
        for (String s : pattern) {
            if (method.indexOf(s) > -1) {
                return true;
            }
        }
        return false;
    }
    
    
    
//  //拦截所有方法
//  @Pointcut("execution(public * *(..))")
//  private void aspectMethod(){}
//  
//  /*
//	 * 配置前置通知,使用在方法aspect()上注册的切入点
//	 * 同时接受JoinPoint切入点对象,可以没有该参数
//	 */
//	@Before(value = "aspectMethod() && @annotation(org.springframework.web.bind.annotation.RequestMapping)")
//	public void before(JoinPoint joinPoint){
//		if(log.isInfoEnabled()){
//			log.info("before " + joinPoint);
//		}
//		System.out.println("111111111111111111111");
//	}
//	
//	//配置后置通知,使用在方法aspect()上注册的切入点
//	@After(value = "aspectMethod() && @annotation(org.springframework.web.bind.annotation.RequestMapping)")
//	public void after(JoinPoint joinPoint){
//		if(log.isInfoEnabled()){
//			log.info("after " + joinPoint);
//		}
//		System.out.println("22222222222222222222222222");
//	}
}

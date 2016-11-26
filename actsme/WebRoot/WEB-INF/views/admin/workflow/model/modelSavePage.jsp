<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/common.jsp" %>
 <script type="text/javascript">
var touz_i = 3;
function delayURL() {
	$("#time").html(touz_i);
	if(touz_i > 0) {
		setTimeout("delayURL()", 1000);
	} else {
		parent.closeTab("流程设计-"+${modelId});
	}
	touz_i--;
} 
 </script> 
  <body onload="delayURL()">
<!--   	<img src="images/success.gif"/> -->
	<span style="font-size: 26px; color: #000; font-weight: bold;line-height: 48px;height: 48px;vertical-align: middle;text-align: center;" id="message">
		恭喜您！流程设计成功！<br/>
		<span id="time" style="color: red">3</span>秒钟后自动关闭窗口! 
	</span>
  </body>
</html>

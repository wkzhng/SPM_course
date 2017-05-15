<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head> 
  
  </head>
  <body>
  <div style="margin-top:20px;margin-right:20px;margin-left:20px;margin-bottom:50px; ">
   <h1 style="font-size: 28px;color: #00a1f1;border-bottom: 1px solid #b6d9e8;line-height: 50px;word-break:break-all;">
   		邮件通知成功!
   </h1>
   <div style="line-height: 180%;">
   <h2 style="color: #000000;font-size:17px;font-weight: bold;line-height: 200%;border-bottom: 1px solid #DDD;">
   		通知的内容如下所示
   </h2>
   <br/>
   	${msg}
  </div>
	<div align="center" style="margin-top:25px; "><a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="javaScript:$('#win').window('close');" style="width:90px">关闭</a></div>  
  </body>

</html>

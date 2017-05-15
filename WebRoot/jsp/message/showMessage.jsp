<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
	</head>
 	<link href="${ctx}/css/fontStyle.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/blogStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
  margin-right: 100px;
  margin-left:20px;
  margin-top:10px;
  margin-bottom:50px;
  padding: 0;
  overflow-x: hidden;
}
</style>
	
  <script type="text/javascript">
  	function deleteMessage(id){
		$.getJSON("${ctx}/deleteMessage.do",
			{"message.id":id},
			function(data){
				$.messager.alert("提示信息",data,'info',function(){
				window.location.href="${ctx}/findMessageList.do";
				});
			});	 	
  	}
	
  </script>	
	
	<body>
	
		<div style="width: 100%">
				<div class="headlink">
					留言板
				</div> 
			<br />
			<s:iterator value="messageList" status="status" var="message">			
				<div class="title">
					<div class="subject">
					主题:&nbsp;&nbsp;${message.title}
					</div>
					<div class="info">
						发表人：${message.name}
					</div>
					<div class="content">
							${message.detail}
					<!--  <br/><a href="">查看全部></a>-->	
					</div>
 					<c:if test="${session.user.position=='1' }">					
						<div class="content">
							<input type="button" class="btn btn-default" style="margin-right:20px;" onclick="deleteMessage('${message.id}')" value="删  除" />					
						</div>	
					</c:if>				
				</div>
				<br/>
			</s:iterator>					
			
		</div>

	</body>
</html>
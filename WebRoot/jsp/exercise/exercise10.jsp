<%@ page language="java" import="java.util.*"
	contentType="text/html; 
charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
		<link href="css/fontStyle.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="article">
			<h1>
				习题：第十章——软件项目集成计划
			</h1>
			<s:if test="#session.user.position=='管理员'">
				<form action="enterExerciseInfo.action?name=exercise10" method="post">
					<input type="submit" class="btn btn-default" value="内容修改">
				</form>
				</s:if>	
			<div class="content">
				<p>
					${ basicInfo.content}
				</p>
			</div>
			
		</div>
	</body>
</html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; 
charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<% 
//----------------------------------------------------------------
 //Project: SPM System (Client SubSystem) 
// JSP Name  :cooperation.jsp 
// PURPOSE : 校企合作界面显示
// HISTORY：
//	Create：
//  Modify：ChenTian    2015.11.07
//  Copyright  : BUPTSSE   
//----------------------------------------------------------------- %>

<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
		<link href="css/fontStyle.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="article">
			
			<h1>
				校企合作
			</h1>
			<c:if test="${session.user.position=='1'}">
				<form action="editBasicInfo.do?name=xiaoqihezuo" method="post">
					<input type="submit" class="btn btn-default" value="内容修改">
				</form>
			</c:if>
			<div class="content">
				<p>
					${ basicInfo.content}
				</p>
<!-- 				<center> -->
<%-- 					<img border="0" src=<%=picturepath.toString()%> width="70%"> --%>
<!-- 				</center> -->
			</div>
		</div>
	</body>
</html>




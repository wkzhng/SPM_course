<%@ page language="java" import="java.util.*"
	contentType="text/html; 
charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<% 
//----------------------------------------------------------------
//Project: SPM System (Client SubSystem) 
// JSP Name  : academicLevel.jsp 
// PURPOSE : 学术水平
// HISTORY：
//	Create：
//	Modify： Xue yifei    2015.11.07
//  Copyright  : BUPTSSE   
//----------------------------------------------------------------- %>

<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
		<link href="css/fontStyle.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="article">
			<h1>
				学术水平
			</h1>
			<c:if test="${session.user.position=='1'}">
				<form action="editBasicInfo.do?name=xueshushuiping" method="post">
					<input type="submit" class="btn btn-default" value="内容修改">
				</form>
			</c:if>
			<div class="content">
				<p>
					${ basicInfo.content}
				</p>
			</div>
		</div>
	</body>
</html>






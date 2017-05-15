<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<% 
//----------------------------------------------------------------
 //Project: SPM System (Client SubSystem) 
// JSP Name  : mainFrame.jsp 
// PURPOSE : 主页面显示
// HISTORY：
//	Create：
//	Modify：Han Xinyu Xue yifei    2015.10.24
//  Copyright  : BUPTSSE   
//----------------------------------------------------------------- %>
<%@	taglib uri="/struts-tags" prefix="s"%>
<html>
	<head>
		<title>"教育部-IBM精品课程建设项目”软件项目管理课程</title>
	</head>
	<frameset rows="22.8%,*,8.8%" border="0">
		<frame src="${ctx}/jsp/top.jsp">
		<frameset cols="22%,*" border="0">
			<frame src="${ctx}/jsp/left.jsp">
			<!-- <frame src="${ctx}/jsp/right.jsp" name="right"> -->
			<frame src="${ctx}/enterIndex.do" name="right">
		</frameset>
		<frame src="${ctx}/jsp/footer.jsp">
	</frameset>
</html>
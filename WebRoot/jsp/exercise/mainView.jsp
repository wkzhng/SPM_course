<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@	taglib uri="/struts-tags" prefix="s"%>
<html>
	<head>
		<title>"教育部-IBM精品课程建设项目”软件项目管理课程</title>
	</head>
	<frameset rows="20.8%,*,8.8%" border="0">
		<frame src="${ctx}/jsp/top.jsp">
		<frameset cols="26%,*" border="0">
			<frame src="${ctx}/jsp/exercise/left2.jsp">
			<!-- <frame src="jsp/exercise/exercise.jsp" name="right2"> -->
			<frame src="enterintro.do?name=exercise0" name="right2">
		</frameset>
		<frame src="${ctx}/jsp/footer.jsp">
	</frameset>
</html>
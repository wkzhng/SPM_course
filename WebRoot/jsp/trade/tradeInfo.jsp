<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
		<link href="css/fontStyle.css" rel="stylesheet" type="text/css" />
	</head>
<style type="text/css">

</style>
	
	<body>
	
	
	
		<div class="article">
			<h1>
				行业信息
			</h1>
			<s:if test="#session.user.position=='管理员'">
				<form action="listTradeinfo.action" method="post">
					<input type="submit" class="btn btn-default" value="行业信息管理">
				</form>
					<div class="content">
				</div>
			</s:if>
			<div class="content">
				<s:iterator value="tradeInfoList" status="status" var="tradeinfo" >
					<p>
						<a href="${ctx}/findTradeInfo.do?idTradeInfo=${tradeinfo.idTradeInfo}">
							${tradeinfo.title } </a>
					</p>
				</s:iterator>
			</div>
		</div>	
	
	</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
//----------------------------------------------------------------
//	Project: SPM System (Client SubSystem) 
// 	JSP Name  : top.jsp 
// 	PURPOSE : 页面顶部导航栏显示
// 	HISTORY：
//	Create：
//	Modify：Han Xinyu Xue yifei    2015.10.24
//  Copyright  : BUPTSSE   
//----------------------------------------------------------------- %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="imagetoolbar" content="no" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>Animated Menu Using jQuery | Demo page alixixi.com</title>
		<!--  <link rel="stylesheet" href="../css/uptitleStyle.css" />-->
		<link rel="stylesheet" href="../css/topanv.v1.0.css" />
		<style>
/**	style used for both examples **/
html{
	height:100%;
}
body {
	font-family:"Microsoft Yahei";
	font-size:12px;
	margin:0;
	width:100%;
	height:100%;
	background: #fff url(../image/header1.jpg)  no-repeat center center fixed;
    background-size:100% 100%;
    position:relative;
}
.menu {
	display: block;
	right:0;
	bottom:0;
	width:60%;
	height:30%;
	background-color:transparent;
	position:absolute;
}

.menu ul {
	list-style: outside none none;
	padding: 0;
	margin: 0;
	width:100%;
	height:100%;
	background-color:transparent;
}

.menu ul li { /* width and height of the menu items */
	float: left;
	overflow: hidden;
	position: relative;
	text-align: center;
	line-height: 100%;
	width:9%;
	font-size:4em;
	background-color:transparent;
}

.menu ul li a { /* must be postioned relative  */
	position: relative;
	display: block;
	height: 40px;
	font-family: "Microsoft YaHei";
	font-size: 16px;
	letter-spacing: 1px;
	text-transform: uppercase;
	text-decoration: none;
	cursor: pointer;
	width:100%;
}

.menu ul li a span { /* all layers will be absolute positioned */
	position: absolute;
	left: 0;
	width: 92px;
}

.menu ul li a span.out {
	top: 0px;
}

.menu ul li a span.over,.menu ul li a span.bg { /* hide */
	top: -40px;
}

/** 1st example **/
#menu {
	background: #EEE;
}

#menu ul li a {
	color: #000;
}

#menu ul li a span.over {
	color: rgba(255,255,255,0);
}

#menu ul li span.bg { /* height of the menu items */
	height: 40px;
	background: url('bg_over.gif') center center no-repeat;
}

/** 2nd example **/
#menu2 {

}

#menu2 ul li a {
	color: #00a1f1;
}

#menu2 ul li a span.over {
	background: rgb(255,255,255,0);
	color: #FFD848;
}
.csstype {
    background: #fff url(../image/header1.jpg)  no-repeat center center fixed;
    background-size:100% auto;
    width:100%;
    margin:0;
    height:100%;
}
</style>
		<script type="text/javascript" src="../js/uptitleJS.js"></script>
		<script language="javascript">
		$(document).ready(function() {

			/* 	1st example	*/

			/// wrap inner content of each anchor with first layer and append background layer
			$("#menu li a").wrapInner( '<span class="out"></span>' ).append( '<span class="bg"></span>' );

			// loop each anchor and add copy of text content
			$("#menu li a").each(function() {
				$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
			});

			$("#menu li a").hover(function() {
				// this function is fired when the mouse is moved over
				$(".out",	this).stop().animate({'top':	'40px'},	250); // move down - hide
				$(".over",	this).stop().animate({'top':	'0px'},		250); // move down - show
				$(".bg",	this).stop().animate({'top':	'0px'},		120); // move down - show

			}, function() {
				// this function is fired when the mouse is moved off
				$(".out",	this).stop().animate({'top':	'0px'},		250); // move up - show
				$(".over",	this).stop().animate({'top':	'-40px'},	250); // move up - hide
				$(".bg",	this).stop().animate({'top':	'-40px'},	120); // move up - hide
			});
					

			/*	2nd example	*/
			
			$("#menu2 li a").wrapInner( '<span class="out"></span>' );
			
			$("#menu2 li a").each(function() {
				$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
			});

			$("#menu2 li a").hover(function() {
				$(".out",	this).stop().animate({'top':	'40px'},	200); // move down - hide
				$(".over",	this).stop().animate({'top':	'0px'},		200); // move down - show

			}, function() {
				$(".out",	this).stop().animate({'top':	'0px'},		200); // move up - show
				$(".over",	this).stop().animate({'top':	'-40px'},	200); // move up - hide
			});
		});

	</script>
	
	
	</head>
	<div style="margin-left:90%;" ><h3>欢迎您：${session.user.userName }</h3></div>		
	<body margin="0" id="top">
		<div id="menu2" class="menu" style="margin-left:30%;z-index: 99999" >
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/enterIndex.do" target="right">首页</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/findTradeInfoList.do" target="right">行业信息</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/listDownLoad.do" target="right">下载区</a>
				</li>
				<li>
					<!-- <s:if test="#session.user.position=='学生'">
						<a href="${pageContext.request.contextPath}/selectCourse4Student.do" target="right">学生</a>
					</s:if>
					<s:if test="#session.user.position=='教师'">
						<a href="${pageContext.request.contextPath}/selectCourse4Teacher.do" target="right">教师</a>
					</s:if>
					-->
					
						
						<a href="${pageContext.request.contextPath}/jsp/course/courseSelect.jsp" target="right">选课</a>
						
					<!--<s:else>	
						<a href="${pageContext.request.contextPath}/selectCourse4Student.jsp" target="right">
						选课sss</a>
					</s:else>-->
				</li>
				<li>
				<!-- 	<a href="../score/2012score.html" target="right">成绩查询</a>
					<a href="GetScoreAction.action"  target="right">成绩查询</a> -->
					
					<a href="${pageContext.request.contextPath}/jsp/course/scoreQueryList.jsp" target="right">成绩查询</a>
				   
				</li>
				<!-- <li> <a href="${pageContext.request.contextPath}/uploadScoreFile.do"  target="right">成绩查询1</a></li>-->
				<li>
					<a href="${pageContext.request.contextPath}/jsp/message/mainMessage.jsp" target="right">留言板</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/listExam.do" target="right">网上测试</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/enterintro.do?name=lianxiwomen" target="right">联系我们</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/logOut.do" target="123">登录入口</a>
				</li>
				
				<c:if test="${session.user.position=='1'}">
					<li>
						<!-- <a href="${pageContext.request.contextPath}/jsp/manage/manageUser.jsp"  target="right">人员管理</a> -->
						 <a href="${pageContext.request.contextPath}/jsp/manage/manageUser.jsp"  target="right">人员管理</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/jsp/manage/configInfo.jsp"  target="right">系统配置</a>
					</li>
					
				</c:if>
			</ul>
		</div>
			
	</body>
</html>
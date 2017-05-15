<%@page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>左侧导航</title>
		<link href="${ctx}/css/leftGuide.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/css/topanv.v1.0.css" rel="stylesheet" type="text/css" />
	</head>

	<body id="bg">

		<div class="container">

			<div class="leftsidebar_box" style="width: 360px">
				<dl class="system_log" style="margin-top: 20px">
					<hr style="border: 1px solid #0099f0;" align="right"></hr>
					<dt onClick="changeImage()">
						序 软件项目管理概述
						<img src="images/left/select_xl01.png"></dt>
					<dd class="first_dd">
						<a href="enterintro.do?name=exercise0" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;序
							软件项目管理概述</a>
					</dd>
				</dl>
				<dl class="custom">
					<div
						style="width: 260px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
					<dt onClick="changeImage()">
						第一篇 软件项目初始
						<img src="images/left/select_xl01.png"/>
					</dt>
					<dd class="first_dd">
						<a href="enterintro.do?name=exercise1" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第一章
							软件项目初始过程</a>
					</dd>
				</dl>

				<dl class="channel">
					<div
						style="width: 260px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
					<dt>
						第二篇 软件项目计划
						<img src="images/left/select_xl01.png"/>
					</dt>
					<dd class="first_dd">
						<a href="enterintro.do?name=exercise2" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第二章
							软件项目范围计划</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise3" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第三章
							软件项目进度计划</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise4" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第四章
							软件项目成本计划</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise5" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第五章
							软件项目质量计划</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise6" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第六章
							软件项目人力资源计划</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise7" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第七章
							软件项目沟通计划</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise8" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第八章
							软件管理风险计划</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise9" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第九章
							软件项目合同计划</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise10" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第十章
							软件项目集成计划</a>
					</dd>
				</dl>

				<dl class="app">
					<div
						style="width: 260px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
					<dt onClick="changeImage()">
						第三篇 软件项目执行控制
						<img src="images/left/select_xl01.png"/>
					</dt>
					<dd class="first_dd">
						<a href="enterintro.do?name=exercise11" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第十一章
							软件项目执行控制过程</a>
					</dd>
					<dd>
						<a href="enterintro.do?name=exercise12" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第十二章
							软件项目配置管理</a>
					</dd>
				</dl>

				<dl class="cloud">
					<div
						style="width: 260px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
					<dt onClick="changeImage()">
						第四篇 软件项目结束
						<img src="images/left/select_xl01.png"></dt>
					<dd class="first_dd">
						<a href="enterintro.do?name=exercise13" target="right2">&nbsp;&nbsp;&nbsp;&nbsp;第十三章
							软件项目结束过程</a>
					</dd>
				</dl>
				<div
					style="width: 260px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
			</div>
		</div>

		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
$(".leftsidebar_box dt").css({"background-color":"#ffffff"});
$(this).css({"color": "#00a1f1"});
$(".leftsidebar_box dt img").attr("src","${ctx}/images/left/select_xl01.png");
$(function(){
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		
		$(".leftsidebar_box dt").css({"color": "#00a1f1"})
		$(".leftsidebar_box dt").css({"background-color":"#ffffff"})
		$(this).css({"color": "#FFD848"});
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".leftsidebar_box dt img").attr("src","${ctx}/images/left/select_xl01.png");
		$(this).parent().find('img').attr("src","${ctx}/images/left/select_xl.png");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
	$(".leftsidebar_box dd a").click(function(){
		$(".leftsidebar_box dd a").css({"color": "#00a1f1"})
		$(this).css({"color": "#FFD848"})
	});
})
</script>

	</body>
</html>

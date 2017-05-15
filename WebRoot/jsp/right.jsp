<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<% 
//----------------------------------------------------------------
 //Project: SPM System (Client SubSystem) 
// JSP Name  : footer.jsp 
// PURPOSE : 右边页面显示
// HISTORY：
//	Create：
//	Modify：Han Xinyu Xue yifei    2015.10.24
//  Copyright  : BUPTSSE   
//----------------------------------------------------------------- %>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
		<link href="${ctx}/css/fontStyle.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/css/tableStyle2.css" rel="stylesheet" type="text/css" />
		<link href="${ctx}/css/picture.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/js/picture.js"></script>
		<style type="text/css">
		body {
		  margin-right: 100px;
		  margin-left:0px;
		  margin-top:10px;
		  margin-bottom:50px;
		  padding: 0;
		  overflow-x: hidden;
		}
		</style>
	</head>
	<body margin="0">
		<table style="width: 100%; margin-left: 10%">
			<tr>
				<td colspan="2">
					<div id="fade_focus" style="margin-right: 40px">
						<div class="loading"> 
							Loading... 
							<br />
							<!--  <img src="/UploadPic/2009-3/200932411630437.gif" width="100"
								height="100" />
							-->
						</div>
						<ul>
							<li>
								<a href="http://www.buptsse.cn/" target="123"><img
										src="${ctx}/image/image1.jpg"  /> </a>
							</li>
							<li>
								<a href="${ctx}/enterintro.do?name=kechengtese" target="right"><img
										src="${ctx}/image/image2.jpg"/> </a>
							</li>
							<li>
								<a href="${ctx}/listSpChapter.do" target="right"><img
										src="${ctx}/image/image3.jpg" /> </a>
							</li>
							<li>
								<a href="${ctx}/enterintro.do?name=cankaoshumu" target="right"><img
										src="${ctx}/image/image4.jpg" /> </a>
							</li>
						</ul>
					</div>
				</td>
				<td line-height="100px">
					<h5 style="margin-right: 10%;margin-left:10%;">
						行业信息
					</h5>
					<marquee direction="up" onMouseOut="this.start()"
						onMouseOver="this.stop()" scrollamount="2"
						style="margin-right: 10%;margin-left:10%;">
						<div class="content">
							<p style="margin-left: 15%">
								<s:iterator value="#session.tradeinfoindex" id="tradeinfo2">
									<p>
										<a
											href="enterTradeinfo2.action?tradeinfo.title=<s:property value="#tradeinfo2.title"/>">
											<s:property value="#tradeinfo2.title" /> </a>
									</p>
								</s:iterator>
								<s:iterator value="tradeInfoList" status="status" var="tradeinfo" >
									<p>
										<a href="${ctx}/findTradeInfo.do?idTradeInfo=${tradeinfo.idTradeInfo}">
											${tradeinfo.title } </a>
									</p>
								</s:iterator>								
								
								<br />
								<br />
								<br />
							</p>
						</div>
					</marquee>
				</td>
			</tr>
			<tr>
				<td style="width: 40%;vertical-align:top;text-align:left">
					<h5 style="margin-right: 10%; margin-top: 10.5%">
						课程简介
					</h5>
					<div class="content">
						<p style="margin-right: 10%">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							随着信息技术的飞速发展，软件产品的规模也越来越庞大，各软件企业都在积极将软件项目管理引入到开发活动中，对软件项目实行有效的管理。软件项目管理是为了使软件项目能够按照预定的成本、进度、质量顺利完成，而进行分析和管理的活动。另外……
							<a href="${ctx}/enterintro.do?name=kechengjianjie" target="right">更多</a>

						</p>
					</div>
				</td>

				<td style="width: 25%;vertical-align:top;text-align:left">
					<h5 style="margin-right: 10%;margin-top:17%">
						课程特点
					</h5>
					<div class="content">
						<p style="margin-right: 10%">
							&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;本课程具有以下特点：
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;1、做中学。
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;2、基于项目的学习。
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;3、情景式授课。
							<a href="${ctx}/enterintro.do?name=kechengtese" target="right">更多</a>
						</p>
					</div>
				</td>
				<td style="vertical-align:top;text-align:left">
					<h5 style="margin-right: 10%; margin-top: 12%;margin-left:10%">
						友情链接
					</h5>
					<div class="content" style="margin-right: 10%;margin-left:10%">
						<p>
							<a href="http://www.bupt.edu.cn/" target="123"> 北京邮电大学 </a>
							<br />
							<a href="http://www.buptsse.cn/" target="123"> 北京邮电大学软件学院 </a>
							<br />
							<a href="http://www.core.org.cn/" target="123"> 国家精品课程导航 </a>
							<br />
							<br />
							<br />
						</p>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>










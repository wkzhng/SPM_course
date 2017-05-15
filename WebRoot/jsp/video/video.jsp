<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
		<link href="${ctx}/css/fontStyle.css" rel="stylesheet" type="text/css" />
		
		<style type="text/css">

			.vdlist{width:100%;}
			.vdlist *{margin:0;padding: 0;}
			.vdlist li{float:left;width:210px;height:225px;margin:0 10px;position: relative;z-index: 100;}
			.vdlist img{width:200px;height:150px;padding:4px;border:1px solid #fff;}
			.vdlist p{height:24px;line-height: 24px;overflow: hidden;}
			.vdlist p span{float:right;}
		</style>		
		
	</head>
	<body>
	<script>

	</script>
		<div class="article">
			<h1><center>我的学习进度：(进度${totalSchedule}%)</center></h1>
			<input id="inputid" type="hidden">
			<h2>
				教学视频
			</h2>	


		<s:iterator value="spChapterList" status="status"  var="spChapter">
   			<ul class="vdlist">
   				<li>
    				<a  class="video" href="${ctx}/videoShow.do?spChapter.chapter_id=${spChapterList[status.index][0]} &spChapter.chapter_name=${spChapterList[status.index][2]}" ><img src="./images/chapter/${spChapterList[status.index][3]}"></a>

   					<p style="font-size: 13px;" align="left">
   						共${spChapterList[status.index][6]}集&nbsp;&nbsp;本章进度：${chapterScheduleList[status.index] }% &nbsp;&nbsp;共${spChapterList[status.index][5]}分钟
   					</p>
   				
					<p style="font-size: 12px;" align="left">
						<a class="video"
							href="${ctx}/videoShow.do?spChapter.chapter_id=${spChapterList[status.index][0]}">
							第${spChapterList[status.index][0]}章&nbsp;&nbsp;
							${spChapterList[status.index][2]}
						</a>
					</p>  				
   				</li>
   			</ul>
   		</s:iterator> 
	
	</body>
</html>







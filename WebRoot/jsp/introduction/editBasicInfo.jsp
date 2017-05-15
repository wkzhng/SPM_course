<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<link href="css/fontStyle.css" rel="stylesheet" type="text/css" />
	</head>
  <script type="text/javascript">	
		 function updateInfo(name){
            $('#fm').form('submit',{
                url: "${ctx}/updateBasicInfo.do",
                success: function(result){
                	var result = eval('('+result+')');
                	if(result.code==1){
                		$.messager.alert("提示信息",result.message,'info',function(){
                			window.location.href="${ctx}/enterintro.do?name="+name;
                		});
                		
                	}else{
                		$.messager.alert("提示信息",result.message);
                	}                   
                    
                }
            });
	 } 
 </script>
	
	<body>
		<div class="article">
			<form id="fm" action="" method="post" enctype="multipart/form-data">
				<h1>
					<c:if test="${ basicInfo.name =='xueshushuiping'}">
				学术水平
					</c:if>
					<c:if test="${ basicInfo.name =='kechengjianjie'}">
				课程简介
					</c:if>
					<c:if test="${ basicInfo.name =='jiaoxuedagang'}">
				教学大纲
					</c:if>
					<c:if test="${ basicInfo.name =='keshianpai'}">
				课时安排
					</c:if>
					<c:if test="${ basicInfo.name =='kechengtese'}">
				课程特色
					</c:if>
					<c:if test="${ basicInfo.name =='kaopingfangshi'}">
				考评方式
					</c:if>
					<c:if test="${ basicInfo.name =='cankaoshumu'}">
				参考书目
					</c:if>
					<c:if test="${ basicInfo.name =='zhishidiansuoyin'}">
				知识点索引
					</c:if>
					<c:if test="${ basicInfo.name =='kaoshidagang'}">
				考试大纲
					</c:if>
					<c:if test="${ basicInfo.name =='jiaoshiduiwu'}">
				教师队伍
					</c:if>
					<c:if test="${ basicInfo.name =='xiaoqihezuo'}">
				校企合作
					</c:if>
					<c:if test="${ basicInfo.name =='lianxiwomen'}">
				联系我们
					</c:if>
					—— 内容修改
				</h1>
				
				<input name="basicInfo.idCourseInfo" type="hidden"  value="${ basicInfo.idCourseInfo}" >
				<input name="basicInfo.name" type="hidden"  value="${ basicInfo.name}" >
				</input>				
				<textarea name="basicInfo.content"
					style="width: 900px; height: 300px; margin: 10px; margin-top: 20px; font-size: 15px">${basicInfo.content}</textarea>				

				<br/>
				<hr color="#00a1f1"/>
					<input type="button" class="btn btn-default"  onclick="updateInfo('${basicInfo.name}')" value="确认修改"
						style="margin-left: 10px"></input>
					<input type="button" class="btn btn-default"  onclick="javaScript:window.history.back(-1)" value="返 回"
						style="margin-left: 10px"></input>											
			</form>
	</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>在线测试</title>
		<link href="css/fontStyle.css" rel="stylesheet" type="text/css" />
	</head>

  <script type="text/javascript">
  
	function delQuestion(examName,number){
	 $.messager.confirm('确认','确认要删除吗？',function(r){
	 	if(r){
			$.getJSON("${ctx}/deleteQuestion.do",
				{"examName":examName,"number":number},
				function(data){
					$.messager.alert("提示信息",data,'info',function(){
						window.location.reload(-1);
					});
				});		 	
	 	}
	 	
	 	
	 
	 });  
		
		
	 }   
  
  
  </script>
  
  <body>

	<form  id="fm" action="${ctx}/checkAnswer.do" method="post" >
	<h1>在线测试——${examName}</h1>
	<input type="hidden" name="examName" value="${examName}">
	<s:iterator value="examList" status="status" var="exam">	
		<div >
			<h2>
				题目:${exam.question }
			</h2>
			<input type="radio"  name="result[${exam.number-1}]" value="A" />A:
			${exam.answerA }
			<br />
			<input type="radio"  name="result[${exam.number-1}]" value="B" />B:
			${exam.answerB }
			<br />
			<input type="radio"  name="result[${exam.number-1}]" value="C" />C:
			${exam.answerC }
			<br />
			<input type="radio"  name="result[${exam.number-1}]" value="D" />D:
			${exam.answerD }
			<br />
			
			<c:if test="${session.user.position=='2' }">
				<td><a href="javaScript:delQuestion('${exam.examName}','${exam.number}')">删除</a></td>
			</c:if>	
						
		</div>					
	 </s:iterator>   
	 <input type="submit" class="btn btn-default" value="提交">
	 <input type="button" class="btn btn-default" onclick="javaScript:window.history.back(-1)" value="返回">
	</form>

  
  </body>
</html>

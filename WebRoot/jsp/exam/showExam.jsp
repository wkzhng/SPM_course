<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  	<link href="${ctx}/css/fontStyle.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/blogStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
  margin-right: 100px;
  margin-left:20px;
  margin-top:10px;
  margin-bottom:50px;
  padding: 0;
  overflow-x: hidden;
}
</style> 
  <script type="text/javascript">
  
 	function createQuestion(){

 	}
    function saveQuestion(){

    } 
 
 
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

	<form  id="fm" method="post" >
	<s:iterator value="examList" status="status" var="exam">	
		<div >
			<h2>
				题目:${exam.question }
			</h2>
			选项A:
			${exam.answerA }
			<br />
			选项B:
			${exam.answerB }
			<br />
			选项C:
			${exam.answerC }
			<br />
			选项D:
			${exam.answerD }
			<br />
			<div class="line"></div>
			正确答案为:${exam.answerRight }
			&nbsp;&nbsp;&nbsp;
			<c:if test="${session.user.position=='2' }">
				<td><a href="javaScript:delQuestion('${exam.examName}','${exam.number}')">删除</a></td>
			</c:if>				
			
			<br />
			
		
			
		</div>					
	    
	 </s:iterator>   
	</form>

  
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <script type="text/javascript">
  

 
	 function delExam(examName){
	 $.messager.confirm('确认','确认要删除吗？',function(r){
	 	
	 	if(r){
			$.getJSON("${ctx}/deleteExam.do",
				{"examName":examName},
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

	<h1 style="font-size: 28px;color: #00a1f1;border-bottom: 1px solid #b6d9e8;line-height: 50px;word-break:break-all;">
	   网上测试
   </h1>  
   <c:if test="${session.user.position=='2' }">
		<form action="${ctx}/jsp/exam/generateExam.jsp" method="post">
			<input type="submit" class="btn btn-default" value="新建测试题">
		</form>	
	</c:if>
	<h2>
		在线测试题列表
	</h2> 

		<s:iterator value="examList" status="status" var="exam">			
				<table border="0" width="60%">
					<tr>
						<td width="50%"><a href="${ctx}/enterExam.do?examName=${exam}">${exam}</a></td>
						<c:if test="${session.user.position=='2' }">
							<td><a href="javaScript:delExam('${exam}')">删除</a></td>
						</c:if>
					</tr>
				</table>
		</s:iterator>	

  </body>
</html>

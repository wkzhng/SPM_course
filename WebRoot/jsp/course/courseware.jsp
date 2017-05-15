<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
  </head>
  
  	<script type="text/javascript">
 
	 function delTeachingPlan(id){
	 var flag="";
	 $.messager.confirm('确认','确认要删除吗？',function(r){
	 	if(r){
			$.getJSON("${ctx}/deleteTeaching.do",
				{"teachingPlan.id":id},
				function(data){
					$.messager.alert("提示信息",data,'info',function(){
						window.location.reload();
					});
				});	
	 		
	 		}
	 		
	 	}); 
	 	
	 }
	 
	 
	 function addTeachingPlan(){
	 
	 	$('#dlg').dialog('open').dialog('setTitle','新增');
	 	
	 }
	 
	 function saveTeachingPlan(){
            $('#fm').form('submit',{
                url: "addTeaching.do",
                success: function(result){
                	if(result==1){
                		$.messager.alert("提示信息","保存成功！",'info',function(){
                			window.location.reload();
                		});
                		
                	}else{
                		$.messager.alert("提示信息","保存失败，请联系管理员！");
                	}
                                 
                }
            });


 	
	 }
	 
	 
 function upload(){
 
	 	$('#fileUpload').form('submit',{
			 url: "${ctx}/addTeaching.do", 	
	         success: function(result){
	          $.messager.alert("提示",result,'info',function (){
	          	window.location.reload();
	          });
	         
	        }	
	 	}); 	
 
 }		 
	 
	 	 

  </script>
  
 <body>
	<body>
		<div class="article">
			<h1>
				授课教案
			</h1>
			<div class="content">
			
			<s:iterator value="pieceList" status="status" var="piece">
				<p>标题： ${ piece.pieceName}</p>
				<p>简介： ${ piece.chapterName} &nbsp;&nbsp;
<a class="color" href="${ctx}${piece.filePath}"/>>点击下载</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${session.user.position=='2'}">
						<a class="color" href="javaScript:delTeachingPlan('${piece.id }')">删除</a>
					</c:if>
				</p>
<!-- 		
				<s:iterator value="teachingPlanList" status="status" var="teachingPlan">
					<c:if test ="${piece.pieceId ==teachingPlan.pieceId}">
						<p>
							
							<a href="${ctx}${teachingPlan.filePath}">第${teachingPlan.chapterId } 章节: ${ teachingPlan.chapterName}</a>
							
							<c:if test="${session.user.position=='2'}">
								&nbsp;&nbsp;
								<a class="color" href="javaScript:delTeachingPlan('${teachingPlan.id }')">删除</a>
							</c:if>

						</p>
					</c:if>				
				</s:iterator>
					
				<s:iterator value="#request.chapterList" id="chapters">
					<s:if test="#pieces.pieceId == #chapters.pieceId">
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<s:if test="#pieces.pieceId != 0">
								<a href="<s:property value="#chapters.filepath"/>">第<s:property value="#chapters.chapterId" />章: <s:property value="#chapters.chapterName" /></a>
							</s:if>
							<s:else>
								<a href="<s:property value="#chapters.filepath"/>">序章: <s:property value="#chapters.chapterName" /></a>
							</s:else>
							

						</p>
					</s:if>
				</s:iterator>
				 -->
			</s:iterator>
			
			
			
			<c:if test="${session.user.position=='2'}">
	
				<input type="button" class="btn btn-default" style="margin-right:20px;" onclick="addTeachingPlan()" value="添加教案" />
				
			    <div id="dlg" class="easyui-dialog"  style="padding:10px 20px"
			            closed="true" buttons="#dlg-buttons">
						<!--<s:form name="fm" id="fm" action="" method="post">
							<h2>
								添加教案
							</h2>
						
							篇序：
								<input class="choose" name="teachingPlan.pieceId"/>
							<br />
							篇名：
								<input class="choose" name="teachingPlan.pieceName"/>
							<br />
							章序：
								<input class="choose" name="teachingPlan.chapterId"/>
							<br />
							章名：
								<input class="choose" name="teachingPlan.chapterName"/>
							<br />
							附件：
								<input class="choose" name="teachingPlan.filePath"/>
							<br />
							<hr/>
							  <input type="submit" class="btn btn-default" style="margin-right:20px;" value="添加" />
						</s:form>-->
					<form id="fileUpload" method="post" action="" enctype="multipart/form-data">
						<h2>
							添加信息
						</h2>
					
						标题：
							<input class="easyui-textbox" type="text"  required="true"  style="height: 30px; width: 500px; margin-left: 20px;"  name="teachingPlan.pieceName" />
						<br />
						<br />
						简介：
							<input class="easyui-textbox" type="text"  required="true" style="height: 30px; width: 500px; margin-left: 20px;"  name="teachingPlan.chapterName"/>
						<br />
						<br />
						附件：
							<!-- <input class="choose" name="downLoad.filePath"/> -->
							<input class="easyui-filebox"  id="file" name="file"  required="true"  buttonText="选择文件"  style="width:500px; height: 26px">
						<br />
						<hr/>
						<input type="button"" class="btn btn-default" style="margin-right:20px;" onclick="upload()" value="上 传" />				
					</form>						
						
						
			    </div>
			    
			    
			    
			    <div id="dlg-buttons">
			       <!-- <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveTeachingPlan()" style="width:90px">保存</a> --> 
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
			    </div>			
						
			</c:if>
			
					<br />
	
			</div>
			
		</div>
	</body>
  
  
  </body>

</html>

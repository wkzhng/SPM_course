<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.buptsse.spm.domain.DownLoad" %>
<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
	</head>
 	<link href="${ctx}/css/fontStyle.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/blogStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">

</style>

  <script type="text/javascript">
	 function uploadFile(){
	 	
	 	$('#dlg').dialog('open').dialog('setTitle','文件上传');
	 
	 }
	 
 function upload(){
 
	 	$('#fileUpload').form('submit',{
			 url: "${ctx}/addDownload.do", 	
	         success: function(result){
	          $.messager.alert("提示",result,'info',function (){
	           $('#fileUpload').form('clear');
	          window.location.reload();
	          
	          });
	         
	        }	
	 	}); 	
 
 }	 
	 
	 
  </script> 
  
	<body>
		<div class="article">
		<h1>下载区
		</h1>
			<div class="content">			
				<s:iterator value="downLoadList" status="status"  var="downLoad" >
					
					<h4>
						${downLoadList[status.index].title}
					</h4>
					<p>
						&nbsp;&nbsp;&nbsp;&nbsp;
						${downLoadList[status.index].statement}
					<a class="color" href="${ctx}${downLoadList[status.index].filePath}"/>>点击下载</a>
					
					<c:if test="${session.user.position=='2' }">
						<a class="color" href="deleteDownload.do?id=${downLoadList[status.index].id}">&nbsp;&nbsp;/&nbsp;&nbsp;删除</a>
					</c:if>
					
					</p>
				</s:iterator>
				
				<c:if test="${session.user.position=='2' }">
					<input type="button" class="btn btn-default" style="margin-right:20px;" onclick="uploadFile()" value="文件上传" />
		   		</c:if>				
				
				
				<div id="dlg" class="easyui-dialog"  style="padding:10px 20px;width: 700px" closed="true" buttons="#dlg-buttons" >   
					<form id="fileUpload" method="post" action="" enctype="multipart/form-data">
						<h2>
							添加信息
						</h2>
					
						标题：
							<input class="easyui-textbox" type="text"  required="true"  style="height: 30px; width: 500px; margin-left: 20px;"  name="downLoad.title" />
						<br />
						<br />
						简介：
							<input class="easyui-textbox" type="text"  required="true" style="height: 30px; width: 500px; margin-left: 20px;"  name="downLoad.statement"/>
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
				<div id="dlg-buttons" align="center">
      				<a href="javascript:void(0)"   class="easyui-linkbutton"  iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关 闭</a>
				</div>
			</div>
		</div>

	</body>
</html>
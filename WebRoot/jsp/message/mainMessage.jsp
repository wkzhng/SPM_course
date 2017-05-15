<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
	</head>
	

<script type="text/javascript" language="javascript">   

function iFrameHeight() {   
	var ifm= document.getElementById("iframepage");   
	var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
	if(ifm != null && subWeb != null) {
	   ifm.height = subWeb.body.scrollHeight;
	   ifm.width = subWeb.body.scrollWidth;
	}   
}


function submitMessage(){
	
	
	$('#fm').form('submit',{
	    url:'${ctx}/saveMessage.do',
	    onSubmit: function(){
	        return $(this).form('validate');
	    },
	    success: function(result){
	    
	    
	    
	    	if(result==1){
		    	$.messager.alert("提示","留言提交成功");
		    	$('#iframepage')[0].src="${ctx}/findMessageList.do";	    	
		    	$('#fm').form('clear');	    	
	    	}else{
	    		$.messager.alert("提示","留言提交失败，请重新输入！");
	    	}

	    }
	});

}



</script>
	<body>
  	<iframe id="iframepage" width="100%" scrolling="no" marginheight="0" marginwidth="0" onLoad="iFrameHeight()" frameborder="0" src="${ctx}/findMessageList.do"    height="" scrolling="no"  > 

	</iframe> 
	

		<div class="article">
			<h1>
				我要留言
			</h1>
			<form id="fm">
				<table>
					<tr>
						<td>
							&nbsp;&nbsp;姓名
						</td>
						<td>
								<input class="easyui-textbox" type="text" name="message.name"   required="true"  style="height: 30px; width: 200px; margin-left: 20px;" />								
						</td>
						<td>
							&nbsp;&nbsp;标题
						</td>
						<td>
							<input class="easyui-textbox" type="text" name="message.title" required="true"  style="height: 30px; width: 200px; margin-left: 20px"/>	
						
						</td>
					</tr>
				</table>
				<textarea class="textarea easyui-validatebox" required="true"   name="message.detail" style="width: 100%; height: 100px; margin: 10px; margin-top: 20px;font-size: 15px;"></textarea>
				<div align="center"> 
				<input type="button" onclick="submitMessage()" class="btn btn-default" value="提交留言"></input>
				</div>
			</form>
		</div>	

	</body>
</html>
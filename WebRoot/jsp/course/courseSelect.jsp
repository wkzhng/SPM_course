<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
  </head>
  
  <script type="text/javascript">
  
  function clearForm(){
  	$('#ff').form('clear');
  }
  
  
  function formatOper(value,row,index){
   if(row.status=="选课成功"){
       return '<a href="#" class="easyui-linkbutton" onclick="operateStatus(5)">取消</a>&nbsp;/&nbsp;<a href="#" class="easyui-linkbutton" onclick="operateStatus(6)">删除</a>';  
    }else if(row.status=="待确认"){
      return '<a href="#" class="easyui-linkbutton" onclick="operateStatus(4)">确认</a>&nbsp;/&nbsp;<a href="#" class="easyui-linkbutton" onclick="operateStatus(5)">取消</a>&nbsp;/&nbsp;<a href="#" class="easyui-linkbutton" onclick="operateStatus(6)">删除</a>';  
    }else if(row.status=="未选"){
      return '<a href="#" class="easyui-linkbutton" onclick="operateStatus(6)">删除</a>';  
    }
 } 
 
 
 //条件查询 
 function initDate(studentId,position){
 	if(position=="3"){
	    $('#dataList')[0].style.display="";
	    $('#dg').datagrid({
	    	url:"${ctx}/courseQuery.do",
	    	queryParams:{stdId:studentId}, //传参
	        onLoadSuccess: function (data){
	        	//alert(data.total);
	        	if(data.total>0){
	        		$('#selectButton')[0].style.display="none";
	        	
	        	}
	        }
	    
	    }); 	
 	} 
 }
 
 
 //条件查询 
 function query(){
	
    $('#dataList')[0].style.display="";
    $('#dg').datagrid({
    url:"${ctx}/courseQuery.do",
    queryParams:{stdId:$('#studentId').val(),
    			classId:$('#classId').val(),
    			name:$('#name').val(),
    			syear:$('#syear').val(),
    			status:$('#status').combobox('getValue')} //传参
    }); 	
 } 
 
 
 
 
 //处理选课状态 flag=1表示批量确认操作，flag=2表示批量取消操作，falg=3 表示批量删除操作，flag=4表示确认操作， flag=5表示取消操作，flag=6 表示删除操作
 //operateType 标志位 U表示确认，C表示取消，D表示删除
 function operateStatus(flag){
 	var msg = "";
 	var operateType = "";
 	if(flag=="1"){
 		msg = "您确定想要批量确认吗？";
 		operateType = "U";
 	}else if(flag=="2"){
 		msg = "您确定想要批量取消吗？";
 		operateType = "C";
 	}else if(flag=="3"){
  		msg = "您确定想要批量删除吗？";
 		operateType = "D";	
 	}else if(flag=="4"){
  		msg = "您确定想要确认吗？";
 		operateType = "U";	
 	}else if(flag=="5"){
  		msg = "您确定想要取消吗？";
 		operateType = "C";	
 	}else if(flag=="6"){
  		msg = "您确定想要删除吗？";
 		operateType = "D";	
 	}
 	
	 $.messager.confirm('确认',msg,function(r){    
	    if (r){  
	        var selRow = $('#dg').datagrid("getSelections");//返回选中多行
			if(selRow.length==0){  
				$.messager.alert("警告","请至少选择一行数据!");  
				return false;  
			}
			var studentIds=[];
			for (var i = 0; i < selRow.length; i++) {  
				//获取自定义table 的中的checkbox值  
				var studentId=selRow[i].studentId;   
				var status=selRow[i].status;
				//符合要求的数据才放到数据组中
				if(operateType=="U"||operateType=="C"){
					if(status=="待确认"||status=="选课成功"){
						studentIds.push(studentId);
					}				
				}else if(operateType=="D"){
					studentIds.push(studentId);//所有状态均可以删除
				}
			
			}
			
			if(studentIds.length>0){
				$.getJSON("${ctx}/courseUpdate.do",
					{"studentIds[]":studentIds,"operateType":operateType},
					function(data){
						$.messager.alert("提示信息",data);
						$('#dg').datagrid("reload");
					});			
			}else{
				$.messager.alert("警告","没有需要确认的数据，请重新选数据!"); 
			}
	    }    
	}); 
 
 }
 
 
 
 function selectCourse(){
 
 	$('#dlg').dialog('open').dialog('setTitle','填写选课信息');
 	
 }
 
	 function saveSelectCourse(){
            $('#fm').form('submit',{
                url: "${ctx}/insertCourse.do",
                success: function(result){
                	var result = eval('('+result+')');
                	if(result.code==1){
                		$.messager.alert("提示信息",result.message,'info',function(){
                			window.location.reload(-1);
                			
                		});
                		
                	}else{
                		$.messager.alert("提示信息",result.message);
                	}                   
                    
                }
            });
 	
	 } 
 
 
  </script>
  
  
 <body onload="initDate('${session.user.userName}','${session.user.position}')">
	<h1 style="font-size: 28px;color: #00a1f1;border-bottom: 1px solid #b6d9e8;line-height: 50px;word-break:break-all;">
	    选课
   </h1>  
 
 <form id="ff" method="post">  
 <c:if test="${session.user.position=='1' }">
 	您作为管理员，无该功能权限！
 </c:if> 
 <c:if test="${session.user.position=='2' }">
	 <table style="background:#efefef; border-collapse:collapse ;"   width="100%" height="80" cellspacing="5" cellpadding="5"> 
	 	<tr>
		 	<td width="15%" align="right" ><label for="name" >班级:</label> </td>
		 	<td width="15%"><input class="easyui-textbox" type="text" id="classId" /> </td>
		 	<td width="15%" align="right"><label for="studentId">学号:</label> </td>
		 	<td width="15%"><input class="easyui-textbox" type="text" id="studentId"  /></td>
		 	<td width="15%" align="right"> <label for="name">姓名:</label> </td>
		 	<td width="25%"><input class="easyui-textbox" type="text" id="name" /></td> 	
	 	</tr>
	 
	    <tr>
	     	<td width="15%" align="right"><label for="email">状态:</label></td>   
	    	<td width="25%">
	    		<select class="easyui-combobox" type="text" id="status"  panelHeight="100" style="width:150px;" >
	    			<option value="">所有状态</option>
	    			<option value="1">待确认</option>
	    			<option value="2">选课成功</option>  
	    			<option value="3">未选</option>  
	    		</select>
	    	</td>    
	    	<td width="15%" align="right"><label for="syear">学年:</label></td>
	    	<td width="15%"><input type="text" class="easyui-textbox" id="syear" ></input></td>
	<!--    <td width="15%" align="right"><label for="email">结束时间:</label></td>
	    	<td width="15%"><input type="text" class="easyui-datebox" ></input></td>-->    	
	
	
	    </tr>
	 </table>

 	    <div style="text-align:center;padding:5px">
 	    
 	        <input type="button" class="btn btn-default" style="margin-right:20px;" onclick="query()" value="查  询" />
 	        <input type="button" class="btn btn-default" style="margin-right:20px;" onclick="clearForm()" value="重  置" />   
	    </div>
 </c:if>	    
 			<c:if test="${session.user.position=='3' }">
				<input type="button" id="selectButton" class="btn btn-default" style="margin-right:20px;" onclick="selectCourse()" value="我要选课" /> 
			</c:if>	  
</form> 



  
  <div id="dataList" style="display:none;" > 
    <table id="dg"  class="easyui-datagrid"  width="100%" 
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false"
            data-options="fit:false,border:false,pageSize:10,pageList:[10,15,20]" >
        <thead>
            <tr >
            	<c:if test="${session.user.position!='3' }">
            		<th data-options="checkbox:true" field=""  ></th>
            	</c:if>
                <th data-options="field:'studentId'" width="15%">学号</th>
                <th data-options="field:'syear'" width="5%">学年</th>                
                <th data-options="field:'name'"  width="20%" >姓名</th>
                <th data-options="field:'classId'" width="20%">班级</th>
                <th data-options="field:'status'"  width="15%">状态</th>
                <c:if test="${session.user.position!='3' }">
                	<th data-options="field:'_operate' ,formatter:formatOper" width="15%">操作</th>
                </c:if>
            </tr>
        </thead>
    </table>  
        <div id="toolbar">
        <c:if test="${session.user.position!='3' }">
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="operateStatus(1)">批量确认</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="operateStatus(2)">批量取消</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-no" plain="true" onclick="operateStatus(3)">批量删除</a>
    	</c:if>
    	</div>
  <div>
  
  
 
     <div id="dlg" class="easyui-dialog"  style="padding:10px 30px"
            closed="true" buttons="#dlg-buttons">
			<s:form name="fm" id="fm" action="" method="post">
				<h2>
					填写选课信息
				</h2>
				<table border="0">
					<tr>
						<td>学号：</td>
						<td> <input  name="course.studentId" class="easyui-textbox" readonly="readonly" style="height: 30px; width: 200px; " value="${session.user.userName}" /></td>
					</tr>
					<tr>
						<td>班级：</td>
						<td><input  name="course.classId" class="easyui-textbox" required="true" style="height: 30px; width: 200px; "/></td>
					</tr>
					<tr>
						<td>姓名：</td>
						<td><input  name="course.name" class="easyui-textbox" required="true" style="height: 30px; width: 200px;  "/></td>
					</tr>
					<tr>
						<td>电子邮箱：</td>
						<td><input  name="course.email" class="easyui-validatebox" data-options="required:true,validType:'email'" style="height: 30px; width: 200px; "/></td>
					</tr>					
					<tr>
						<td>手机号：</td>
						<td><input  name="course.telno" class="easyui-textbox"  style="height: 30px; width: 200px;"/></td>
					</tr>
					<tr>
						<td>学年：</td>
						<td><input  name="course.syear" class="easyui-textbox"  data-options="required:true,validType:'number'"  style="height: 30px; width: 200px;"/>(如:2015)</td>
					</tr>											
				</table>
				<!--  <input type="submit" class="btn btn-default" style="margin-right:20px;" value="添加" />-->
			</s:form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveSelectCourse()" style="width:90px">确认</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>	 
  
  
  </body>
</html>

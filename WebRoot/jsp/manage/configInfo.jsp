<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
  </head>
  
  <script type="text/javascript">
  var url;
  function clearForm(){
  	$('#ff').form('clear');
  }
  
  
  function formatOper(value,row,index){
      return '<a href="#" class="easyui-linkbutton" onclick="editConfigInfo()">编辑</a>';  
 } 
 
 
 //条件查询 
 function editConfigInfo(){
      var row = $('#dg').datagrid('getSelected');
      if (row){
          $('#dlg').dialog('open').dialog('setTitle','编辑');
          $('#fm').form('load',row);
          url = '${ctx}/editConfigInfo.do?id='+row.id;
      }
 }
 
  function saveConfigInfo(){
	  $('#fm').form('submit',{
	      url: url,
	      success: function(result){
	      	var result = eval('('+result+')');
	      	if(result.code==1){
	      		$.messager.alert("提示信息",result.message,'info',function(){
	      			$('#dlg').dialog('close');
	      			$('#dg').datagrid('reload');
	      		});
	      	}else{
	      		$.messager.alert("提示信息",result.message);
	      	}                   
	      }
	  });	
	
 }
 
 
 
  </script>
  
  
 <body>
	<h1 style="font-size: 28px;color: #00a1f1;border-bottom: 1px solid #b6d9e8;line-height: 50px;word-break:break-all;">
	    配置信息管理
   </h1>  
 
 <form id="ff" method="post">   
 
 
</form> 
  
  <div id="dataList"  > 
    <table id="dg"  class="easyui-datagrid"  width="100%" 
    		url="${ctx}/listConfigInfo.do"
            pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false" 
            data-options="fit:false,border:false,pageSize:10,pageList:[10,15,20]" >
        <thead>
            <tr >
                <th data-options="field:'configType'" width="15%">配置类型</th>                
                <th data-options="field:'configCode'"  width="20%" >配置代码</th>
                <th data-options="field:'configValue'" width="20%">配置值</th>
                <th data-options="field:'configDesc'"  width="15%">配置描述 </th>
                <th data-options="field:'_operate' ,formatter:formatOper" width="5%">操作</th>
            </tr>
        </thead>
    </table>  

  <div>
  
  
    <div id="dlg" class="easyui-dialog"  style="padding:10px 50px"
            closed="true" buttons="#dlg-buttons">
 			<s:form name="fm" id="fm" action="" method="post">
				<h2>
					修改配置信息
				</h2>
				<table border="0">
				
					<tr>
						<td>配置类型：</td>
						<td> <input  name="configType" class="easyui-textbox" readonly="readonly"  style="height: 30px; width: 200px; "/></td>
					</tr>
					</br>
					<tr>
						<td>配置代码：</td>
						<td><input  name="configCode" class="easyui-textbox" readonly="readonly"  style="height: 30px; width: 200px; "/></td>
					</tr>
					<tr>
						<td>配置值：</td>
						<td><input  name="configValue" class="easyui-textbox" required="true" style="height: 30px; width: 200px;  "/></td>
					</tr>
					<tr>
						<td>配置描述：</td>
						<td><input  name="configDesc" class="easyui-validatebox" data-options="required:true" style="height: 30px; width: 200px; "/></td>
					</tr>
					<tr>
						<td>有效标志：</td>
						<td>
				    		<select class="easyui-combobox" type="text" id="validate"  name="validate" panelHeight="80" style="width:150px;" >
				    			<option value="1">有效</option>
				    			<option value="0">无效</option>   
				    		</select>						
						
						</td>
					</tr>					
										
													
				</table>
		     <div id="dlg-buttons">
		        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveConfigInfo()" style="width:90px">保存</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
		    </div> 	
			</s:form>       
      
    </div> 
	 
  
  
  </body>
</html>

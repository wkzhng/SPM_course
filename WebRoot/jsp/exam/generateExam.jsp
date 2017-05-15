<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <script type="text/javascript">
 
	function iFrameHeight() {   
		var ifm= document.getElementById("iframepage");   
		var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
		if(ifm != null && subWeb != null) {
		   ifm.height = subWeb.body.scrollHeight;
		   ifm.width = subWeb.body.scrollWidth;
		}   
	} 
  
 
 	
    function saveQuestion(){
        $('#fm').form('submit',{
        	url:'${ctx}/addQuestion.do',
            success: function(result){
                if (result=="1"){
                    $.messager.alert("提示","保存成功",'info',function(){
                    
                     var name =  $('#examName').val();
                    //$('#fm').form('clear');
                    //$('#examName').val(name);
                    	$('#iframepage')[0].src="${ctx}/queryQuestion.do?examName="+name;                   
                    });

                } else {
                    $('#dlg').dialog('close');        // close the dialog
                    $('#dg').datagrid('reload');    // reload the user data
                }
            }
        });
    } 
 
 
	 function goBack(){
	 	window.location.href="${pageContext.request.contextPath}/listExam.do";
	 	
	 }
 
 
        $.extend($.fn.validatebox.defaults.rules, {
            radio: {
                validator: function (value, param) {
                    var frm = param[0], groupname = param[1], ok = false;
                    $('input[name="' + groupname + '"]', document[frm]).each(function () { //查找表单中所有此名称的radio
                        if (this.checked) { ok = true; return false; }
                    });
                    return ok
                },
                message: '需要选择一项正确答案！'
            }
        });

 
  </script>
  
  <body>

	<h1 style="font-size: 28px;color: #00a1f1;border-bottom: 1px solid #b6d9e8;line-height: 50px;word-break:break-all;">
	  生成试卷
   </h1>  
	<form  id="fm" method="post" >
		<h2>
			请输入测试标题:
			<input type="text"  id="examName" name="exam.examName" class="easyui-textbox"
				style="height: 30px; width: 300px; margin-left: 20px;margin-bottom: 10px;" required="true"/>
		</h2>
		<!-- <input type="button"  onclick="createQuestion()" class="btn btn-default" value="新建测试题"> -->
		<div >
			<h2>
				题目:
				<input id="exam.question" name="exam.question" class="easyui-textbox" style="height: 30px; width: 300px; margin-left: 20px;" required="true" ></input>
			</h2>
			选项A:
			<input  id="exam.answerA" type="text" name="exam.answerA" class="easyui-textbox" style="height: 30px; width: 300px; margin-left: 20px;" required="true" />
			<br />
			<br />
			选项B:
			<input id="exam.answerB" type="text" name="exam.answerB" class="easyui-textbox" style="height: 30px; width: 300px; margin-left: 20px;" required="true"/>
			<br />
			<br />
			
			选项C:
			<input id="exam.answerC" type="text" name="exam.answerC" class="easyui-textbox" style="height: 30px; width: 300px; margin-left: 20px;" required="true" />
			<br />
			<br />
			选项D:
			<input id="exam.answerD" type="text" name="exam.answerD" class="easyui-textbox" style="height: 30px; width: 300px; margin-left: 20px;" required="true" />
			<br />
			<br />
			<div class="line"></div>
			正确答案为:
			<input type="radio" id="t1" name="exam.answerRight" value="A"  class="easyui-validatebox" validType="radio['fm','exam.answerRight']"/>
			A
			<input type="radio" id="t1" name="exam.answerRight" value="B"  class="easyui-validatebox" />
			B
			<input type="radio" id="t1" name="exam.answerRight" value="C"  class="easyui-validatebox" />
			C
			<input type="radio" id="t1" name="exam.answerRight" value="D"  class="easyui-validatebox" />
			D
			<br />
		</div>					
	    <div id="dlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveQuestion()" style="width:90px">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="goBack()" style="width:90px">返回</a>
	    </div>	
	</form>
	<h2>
		本套测试题列表
	</h2> 
	<iframe id="iframepage" width="100%" scrolling="no" marginheight="0" marginwidth="0" onLoad="iFrameHeight()" frameborder="0" src="${ctx}/queryQuestion.do"    height="" scrolling="no"  > 

	</iframe> 
  
  </body>
</html>

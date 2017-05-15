<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 		<!-- ECharts单文件引入 -->
		<script src="${ctx}/common/dist/echarts.js"></script>
  </head>
  
  <script type="text/javascript">
  
  function clearForm(){
  	$('#ff').form('clear');
  }
  
  
  function formatOper(value,row,index){
     return '<a href="#" class="easyui-linkbutton" onclick="sendEmail(2)">发邮件</a>';  
   // return  '<input class="easyui-linkbutton" onclick="emailNotify()" value="发邮件" />';
 } 
 
 
 //条件查询 
 function query(){
    $('#dataList')[0].style.display="";
    $('#dg').datagrid({
    url:"${ctx}/courseQuery.do",
    queryParams:{stdId:$('#studentId').val(),
    			classId:$('#classId').val(),
    			name:$('#name').val(),
    			syear:$('#syear').val()} //传参
    });
    
 }
 
 function emailNotify(){

	$.getJSON("${ctx}/emailNotify.do",
		{"studentId":studentId},
		function(data){
			$.messager.alert("提示信息",data);
			$('#dg').datagrid("reload");
		});	
 
 }
 
 

 //处理选课状态 flag=1表示批量确认操作，flag=2表示批量取消操作，flag=3表示确认操作，flag=4表示取消操作
 function sendEmail(flag){
 	var msg = "";
 	var operateType = "";
 	if(flag=="1"){
 		msg = "您确定想要批量发送邮件吗？";
 	}else if(flag=="2"){
 		msg = "您确定想要发送邮件吗？";
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
				var studentId=selRow[i].studentId;   
				studentIds.push(studentId);
			}
			
			if(studentIds.length>0){
			 $('#win').window({    
			    title:"提示信息",
			    width:500,    
			    height:400,    
			    modal:true ,
			    href:"${ctx}/emailNotify.do?studentIds[]="+studentIds 
			});				
			}else{
				$.messager.alert("警告","没有需要确认的数据，请重新选数据!"); 
			}
	    }    
	}); 
 
 }
 

   var yValue1= new Array(); //定义一数组       
   var style="line";
	function changeStyle(event){
	    var rows = $('#dg').datagrid('getRows');
	    var number=[0,0,0,0,0,0,0,0,0,0];
	    for (var i = 0; i < rows.length; i++) {
	    	number[parseInt(rows[i]['finalGrade']/10)]++;
	    }
    		         
		yValue1=number;	         
		style=event.name;
	    if(style=="pie"){
	        showpie()
	    }else{
	    	show();
		}
		
	}
        function showResult(event){
         style='line';
            show();
        }
        function show(){
        //路径配置
        require.config({
            paths: {
                echarts: '${ctx}/common/dist'
            }
        });
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/'+style // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var option = {
               //     calculable:true,
                    title:{
                        show: true,
                        text:'成绩分析',
                        x:'center'
                    },
			 toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
                    legend: {                                   // 图例配置
                        padding: 5,                             // 图例内边距，单位px，默认上下左右内边距为5
                        itemGap: 10,                            // Legend各个item之间的间隔，横向布局时为水平间隔，纵向布局时为纵向间隔
                        data: ['人数'],
                        y:'bottom'
                    },
                    tooltip: {                                  // 气泡提示配置
                        trigger: 'axis'                        // 触发类型，默认数据触发，可选为：'axis'
                    },
                    xAxis: [                                    // 直角坐标系中横轴数组
                        {
                            type: 'category',                   // 坐标轴类型，横轴默认为类目轴，数值轴则参考yAxis说明
                             data:['10分以下','10~20分','20~30分','30~40分','40~50分','50~60分','60~70分','70~80分','80~90分','90~100分']
                        }
                    ],
                    yAxis: [                                    // 直角坐标系中纵轴数组
                        {
                            type: 'value',                      // 坐标轴类型，纵轴默认为数值轴，类目轴则参考xAxis说明
                            boundaryGap: [0.1, 0.1],            // 坐标轴两端空白策略，数组内数值代表百分比
                            splitNumber: 4                      // 数值轴用，分割段数，默认为5
                        }
                    ],
                    series: [
                        {
                            name: '人数',                        // 系列名称
                            type: style,                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
                            data: yValue1
                        }
                    ]

                };
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
        }
        function showpie(){
            //路径配置
        require.config({
            paths: {
                echarts: '${ctx}/common/dist'
            }
        });
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/'+style // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                var option = {
    title : {
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        y:'center',
        data:['10~20分','20~30分','30~40分','40~50分','50~60分','60~70分','70~80分','80~90分','90~100分']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'成绩分析',
            type:'pie',
            radius : '60%',
            center: ['50%', '60%'],
            data:[
             {value:yValue1[0], name:'10分以下'},
                {value:yValue1[1], name:'10~20分'},
                {value:yValue1[2], name:'20~30分'},
                {value:yValue1[3], name:'30~40分'},
                {value:yValue1[4], name:'40~50分'},
                {value:yValue1[5], name:'50~60分'},
                {value:yValue1[6], name:'60~70分'},
                {value:yValue1[7], name:'70~80分'},
                {value:yValue1[8], name:'80~90分'},
                {value:yValue1[9], name:'90~100分'}
            ]
        }
    ]
};
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
        }
       
 

 function uploadFile(){
 	
 	
 	var fileName = $('#file').filebox('getValue');
 	var prefix = fileName.substring(fileName.lastIndexOf(".")+1);
 	if(prefix=="xlsx"||prefix=="xls"){
 	
	 	$('#fileUpload').form('submit',{
			 url: "${ctx}/uploadScoreFile.do", 	
	         success: function(result){
	          $.messager.alert("提示",result);
	          $('#fileUpload').form('clear');
	        }	
	 	}); 	
 	
 	}else{
 		$.messager.alert("提示信息","您上传的文件格式为："+prefix+"，请上传文件格式为xls或xlsx的文件");
 	
 	}
 

 
 }

 
 function uploadScore(){
 	
 	$('#dlg').dialog('open').dialog('setTitle','成绩上传');
 
 }
 
 
 
  //条件查询 
 function initDate(studentId,position){
 	if(position=="3"){
	    $('#dataList')[0].style.display="";
	    $('#dg').datagrid({
	    	url:"${ctx}/courseQuery.do",
	    	queryParams:{stdId:studentId} //传参    
	    }); 	
 	} 
 }
 
  </script>
  
  
  <body onload="initDate('${session.user.userName}','${session.user.position}')">

	<h1 style="font-size: 28px;color: #00a1f1;border-bottom: 1px solid #b6d9e8;line-height: 50px;word-break:break-all;">
	    成绩查询
   </h1>  
 <c:if test="${session.user.position=='1' }">
 	您作为管理员，无该功能权限！
 </c:if> 


<div id="dlg" class="easyui-dialog"  style="padding:10px 20px;width: 700px" closed="true" buttons="#dlg-buttons" >   
 <form id="fileUpload" method="post" enctype="multipart/form-data">
	  <table style="border-collapse:collapse ;"  width="600px" height="50px" cellspacing="5" cellpadding="5"> 
	 	<tr>
		 	<td  width="150px" align="right"  ><label for="fileName" >成绩文件选择:</label> </td>
		 	<td   width="200px" align="left" ><input class="easyui-filebox"  id="file" name="file" buttonText="选择文件"  accept=".xlsx,.xls" style="width:300px; height: 26px"> </td>
		 	<td width="100px"   align="left" ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="uploadFile()" style="width: 100px">上  传</a> </td>
	 	</tr>
	  </table>
 </form>  
</div>
<div id="dlg-buttons" align="center">
      <a href="javascript:void(0)"   class="easyui-linkbutton"  iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关 闭</a>
</div>  
  
 <c:if test="${session.user.position=='2' }">     
	 <form id="ff" method="post">   
	 <table style="background:#efefef; border-collapse:collapse ;"   width="100%"  height="50px" cellspacing="5" cellpadding="5"> 
	 	<tr>
		 	<td width="10%" align="right" ><label for="name" >班级:</label> </td>
		 	<td width="10%"><input class="easyui-textbox" type="text" id="classId" /> </td>
		 	<td width="10%" align="right"><label for="studentId">学号:</label> </td>
		 	<td width="10%"><input class="easyui-textbox" type="text" id="studentId"  /></td>
		 	<td width="10%" align="right"> <label for="name">姓名:</label> </td>
		 	<td width="10%"><input class="easyui-textbox" type="text" id="name" /></td> 
		 	<td width="10%" align="right"> <label for="syear">学年:</label> </td>
		 	<td width="20%"><input class="easyui-textbox" type="text" id="syear" /></td> 	 		
	 	</tr>
	  
	 </table>
	 	    <div style="text-align:center;padding:5px">
		    	<input type="button" class="btn btn-default" style="margin-right:20px;" onclick="query()" value="查  询" />
		    	<input type="button" class="btn btn-default" style="margin-right:20px;" onclick="clearForm()" value="重 置" />
				<c:if test="${session.user.position!='3' }">
					<input type="button" class="btn btn-default" style="margin-right:20px;" onclick="uploadScore()" value="成绩上传" />
		   		</c:if>
		    </div>
	 
	</form> 
</c:if>  
  <div id="dataList" style="display: none;" > 
    <table id="dg"  class="easyui-datagrid"  width="100%" 
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false"
            data-options="fit:false,border:false,pageSize:10,pageList:[10,15,20,500]" >
        <thead>
            <tr>
            	<c:if test="${session.user.position!='3' }">
                	<th data-options="checkbox:true" field=""  ></th>
                </c:if>
                <th data-options="field:'studentId'" width="10%">学号</th>
                <th data-options="field:'syear'" width="5%">学年</th>
                <th data-options="field:'name'" width="10%">姓名</th>
                <th data-options="field:'classId'" width="10%">班级</th>
                <th data-options="field:'dailyGrade'" width="10%">平时成绩</th>
                <th data-options="field:'midGrade'"  width="10%" >期中成绩</th>
                <th data-options="field:'finalGrade'" width="10%">期末成绩</th>
                <th data-options="field:'practiceGrade'" width="10%">试验成绩</th>
                <th data-options="field:'totalGrade'" width="10%">总成绩</th>
                <th data-options="field:'_operate' ,formatter:formatOper" width="10%">个体通知</th>
            </tr>
        </thead>     
        
    </table>  
        <div id="toolbar">
        <c:if test="${session.user.position!='3' }">
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="sendEmail(1)">群发邮件通知成绩</a>
    	</c:if>
    	</div>
  <div>
  
   <div id="win"></div> 
   
  	<c:if test="${session.user.position=='2' }">
		<!-- 成绩分析 
		<input type="button" class="btn btn-default" onclick="showResult()" value="成绩分析">-->
		<input type="button" class="btn btn-default" name="line" onclick="changeStyle(this)" value="成绩分析">
		</input>
		<button id="button1" name="bar" class="btn btn-default"
			onclick="changeStyle(this)">
			柱状图
		</button>
		<button id="button2" name="line" class="btn btn-default"
			onclick="changeStyle(this)">
			折线图
		</button>
		<button id="button3" name="pie" class="btn btn-default"
			onclick="changeStyle(this)">
			饼图
		</button>
		<br>  
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<div id="main" style="height: 400px"></div> 
	</c:if>  
  
  </body>
</html>

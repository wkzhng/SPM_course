<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>在线测试</title>
		<link href="css/fontStyle.css" rel="stylesheet" type="text/css" />
	</head>

  <script type="text/javascript">
  
 	function createQuestion(){

 	}
    function saveQuestion(){

    } 
 
  </script>
  
  <body>

	<form  id="fm" action="${ctx}/checkAnswer.do" method="post" >
	<h1>在线测试——${examName}</h1>
	<div class="content2">
		在本次在线测试过程中你一共答对了${rightNumber}道题，考试成绩为${score }分！
	</div>	
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
			
			<div class="content2">
				正确答案：${exam.answerRight }
				&nbsp;&nbsp;&nbsp;&nbsp;
				你的答案：
				${result[status.index]}
			</div>
			
		</div>					
	 </s:iterator>   
	</form>

  
  </body>
</html>

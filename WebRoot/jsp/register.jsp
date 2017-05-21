<%@ page language="java" import="java.util.*" contentType="text/html;  charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%--   
//----------------------------------------------------------------
 //Project: SPM System (Client SubSystem) 
// JSP Name  : register.jsp 
// PURPOSE : 登入与注册界面的处理
// HISTORY：
//	Create：
//	Modify：Xue yifei    2015.10.27
//  Copyright  : BUPTSSE   
//----------------------------------------------------------------- 
--%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>"教育部-IBM精品课程建设项目”软件项目管理课程</title>
		<!-- 		插入外部样式表，使用DwrUtil -->
		<script type="text/javascript" src="./dwr/util.js"></script>
		<script type="text/javascript" src="./dwr/engine.js"></script>
		<script type="text/javascript" src="./dwr/interface/dwrUtil.js"></script>
		<script type="text/javascript">
		
		function init(){
			if('<%=session.getAttribute("user")%>' != 'null'){
				window.location.href='${ctx}/jsp/mainFrame.jsp';
			}
		}
		
		function register(position){
			var registerUserName = document.getElementById("user");
			var registerPassWord = document.getElementById("passwd");
			var registerPassWord1 = document.getElementById("passwd2");
			var registerEmail = document.getElementById("email");
			dwrUtil.registerCheck(registerUserName.value,registerPassWord.value,registerPassWord1.value,registerEmail.value,callback);
			function callback(result){
				if(result == "success"){
					//$.messager.alert("提示信息","注册成功！");
					var registform=$('#registFm'); //得到form对象
					var tmpInput = $("<input type='text' name='user.position'/>");
					tmpInput.attr('value', position);
        			registform.append(tmpInput);
        			registform.form('submit',{
		                url: "${ctx}/registerAction.do",
		                success: function(result){
		                	$("#msgRegist").html(result);
							$('#registFm').form('clear');
		                }
		            });	
				}else{
					$("#msgRegist").html("注册失败，请重新注册！");
					//$.messager.alert("注册失败，请重新注册！");
				}
			}		
			
			
		}
		
		
		function login(){
			var loginUserName = document.getElementById("u");
			var loginPassWord = document.getElementById("p");
// 			alert("开始调用dwr进行登录校验");
			/* 下面一行实际上是没有意义的 */
			dwrUtil.loginCheck(loginUserName.value,loginPassWord.value,callback);
			function callback(result){
				if(result == "1"){
					//alert("登入成功！");
					document.getElementById("loginForm").submit();
				}else{
					//alert("登入s！");
					$("#msg").html("用户名或密码错误，请重新输入！");
				}
			}
		}
		
		function loginExistenceCheck(){
			var loginUserName = document.getElementById("u");
			dwrUtil.extenceCheck(loginUserName.value,callback);
			function callback(result){
				if(result == "extence"){
					document.getElementById('UserNameMsg').style.display="none";
				}else{
					var msg = document.getElementById("labelUserNameMsg");
					if(result == "unExtence"){
						msg.innerHTML = "用户名不存在";
					}else {
						msg.innerHTML = result;
					}
					document.getElementById('UserNameMsg').style.display="block";
				}
			}
		}
		
		function registerExtenceCheck(){
			var loginUserName = document.getElementById("user");
			dwrUtil.extenceCheck(loginUserName.value,callback);
			function callback(result){
				if(result == "unExtence"){
					document.getElementById('RegisterNameMsg').style.display="none";
				}else{
					var msg = document.getElementById("labelUserNameMsg1");
					if(result == "extence"){
						msg.innerHTML = "用户名已存在";
					}else {
						msg.innerHTML = result;
					}
					document.getElementById('RegisterNameMsg').style.display="block";
				}
			}
		}
		
		function registerPassWordCheck(){
			var password = document.getElementById("passwd");
			dwrUtil.isPassword(password.value,callback);
			function callback(result){
				if(result == "yes"){
					document.getElementById('PasswordMsg').style.display="none";
				}else{
					document.getElementById('PasswordMsg').style.display="block";
				}
			}
		}
		
		function registerPassWordCheck2(){
			var password1 = document.getElementById("passwd").value;
			var password2 = document.getElementById("passwd2").value;
			var passwordMsg1 = document.getElementById("PasswordMsg1");
			if(password1 != password2){
				passwordMsg1.style.display="block";
			}else{
				passwordMsg1.style.display="none";
			}
		}
		
		function emailCheck(){
			var email = document.getElementById("email").value;
			dwrUtil.emailCheck(email,callback);
			function callback(result){
				if(result == "OK"){
					document.getElementById('EmailMsg').style.display="none";
				}else{
					document.getElementById('EmailMsg').style.display="block";
				}
			}
		}
			
		</script>
		<link href="./css/login2.css" rel="stylesheet" type="text/css" />
	</head>
	<body onload="init()">
		<h1>
			北邮爱课堂系统
			<sup>
				V2015
			</sup>
		</h1>
<!-- background: #fff url(../images/1.jpg) 100% 0 no-repeat;-->
		
		<div class="login" style="margin-top: 50px;">

			<div class="header">
				<div class="switch" id="switch">
					<a class="switch_btn_focus" id="switch_qlogin"
						href="javascript:void(0);" tabindex="7">快速登录</a>
					<a class="switch_btn" id="switch_login" href="javascript:void(0);"
						tabindex="8">快速注册</a>
					<div class="switch_bottom" id="switch_bottom"
						style="position: absolute; width: 64px; left: 0px;"></div>
				</div>
			</div>
			<div class="web_qr_login" id="web_qr_login"
				style="display: block; height: 235px;">
				<form id="loginForm" name="loginForm" action="${pageContext.request.contextPath}/loginAction.do" method="post" >
					<!--登录-->
					<div class="web_login">
						<div class="login-box">
							<div class="login_form">
								<input type="hidden" name="to" value="log" />
								<div class="uinArea" id="uinArea">
									<label class="input-tips" for="u">
										帐号：
									</label>
									<div class="inputOuter" id="uArea">
										<input type="text" id="u" name="user.userName" onBlur="loginExistenceCheck();" 
											class="easyui-textbox" data-options="iconCls:'icon-man'" style="width:200px;height:38px;" />
									</div>
								</div>
								
								<div class="UserNameMsg" id="UserNameMsg" style="display:none;color:#F00">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label id="labelUserNameMsg" class="text" for="pm">
										用户名应为10位！
									</label>
								</div>
								
								<div class="pwdArea" id="pwdArea">
									<label class="input-tips" for="p">
										密码：
									</label>
									<div class="inputOuter" id="pArea">
										<input type="password" id="p" name="user.password"
											class="easyui-textbox" data-options="iconCls:'icon-lock'" style="width:200px;height:38px;"  />
									</div>
								</div>

								<div id="msg" align="center" style="color: red;"></div>
								
								<table border="0" align="left">

									<tr>
										<td>
											<div style="padding-left: 0px; margin-top: 20px;">
												<input type="button" onclick="login()" value="立即登录" style="width: 120px;"
													class="button_blue" />	
											</div>
											
										</td>
										<td>
											<div style="padding-left: 20px; margin-top: 20px;">
												<input type="submit" formaction="${ctx}/jsp/mainFrame.jsp" value="游客登陆"
													style="width: 120px;" class="button_blue" />
											</div>
										</td>
									</tr>
								</table>
							</div>

						</div>

					</div>
					<!--登录end-->
				</form>
			</div>

			<!--注册-->
			<div class="qlogin" id="qlogin" style="display: none;">
				<form id="registFm" action="" method="post">
					<div class="web_login">
					
						<ul class="reg_form" id="reg-ul">
						
							<li>
								<label class="input-tips2">
									用户名：
								</label>
								<div class="inputOuter2">
									<input type="text" id="user" maxlength="10" name="user.userName" onBlur="registerExtenceCheck();" 
										class="inputstyle2" />
								</div>

								<br>
								<br>
							</li>

							<div class="RegisterName" id="RegisterNameMsg" style="display:none;color:#F00">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label id="labelUserNameMsg1" class="text" for="pm">
									用户名应为10位！
								</label>
							</div>

							<li>
								<label class="input-tips2">
									密码：
								</label>
								<div class="inputOuter2">
									<input type="password" id="passwd" name="user.password" onBlur="registerPassWordCheck();" 
										maxlength="16" class="inputstyle2" />
								</div>
								<br>
								<br>
							</li>
							
							<div class="PasswordMsg" id="PasswordMsg" style="display:none;color:#F00">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="text" for="pm">
									密码必须为6位以上，16位以下,且必须和只能包含字母和数字！
								</label>
							</div>
							
							<li>
								<label class="input-tips2">
									确认密码：
								</label>
								<div class="inputOuter2">
								<input type="password" id="passwd2" name="user.password1" onBlur="registerPassWordCheck2();"
										maxlength="16" class="inputstyle2" />
								</div>

								<br>
								<br>
							</li>
							
							<div class="PasswordMsg" id="PasswordMsg1" style="display:none;color:#F00">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label class="text" for="pm" id="twiceCheck">
									两次输入密码不一致，请重新输入！
								</label>
							</div>
							
							<li>
								<label class="input-tips2">
									邮箱：
								</label>
								<div class="inputOuter2">
									<input type="text" id="email" name="user.email" onBlur="emailCheck();" 
										class="inputstyle2" />
								</div>

								<br>
								<br>
							</li>
							
							<div class="Email" id="EmailMsg" style="display:none;color:#F00">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label id="labelEmailMsg1" class="text" for="pm">
									邮箱不符合规范！
								</label>
							</div>
							
							<div id="msgRegist" align="center" style="color: red;"></div>
							
							<li>
							<table border="0" align="left">
								<tr>
									<td>
										<div class="inputArea">
											<input type="button"
												style="margin-top: 10px; margin-left: 40px;"
												class="button_blue" value="学生注册" onclick="register(3);" />
										</div>
									</td>
									
									<td>
										<div class="inputArea">
											<input type="button"
												style="margin-top: 10px; margin-left: 40px;"
												class="button_blue" value="老师注册" onclick="register(2);" />
										</div>
									</td>
								</tr>
							</table>
							</li>
						</ul>

					</div>
				</form>
			</div>
			<!--注册end-->
		

		
		
		</div>
		<div class="jianyi">
			版权所有&nbsp;&nbsp;北京邮电大学&nbsp;&nbsp;地址：北京市西土城路10号&nbsp;&nbsp;邮编：100876
		</div>
		
	</body>
</html>
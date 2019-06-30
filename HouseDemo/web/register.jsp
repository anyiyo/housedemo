<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String  path =request.getContextPath();
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" >
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="utf-8">
        <title>注册</title>
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" href="css/register.css">
		<script src="js/jquery-2.1.0.min.js"></script>

		<script>
			function checkUsername() {
				var username = $("#username").val();
				var reg_username = /^\w{1,20}$/;
			    var flag = reg_username.test(username);
			    if(flag){
                    $("#username").css("border","");
				}else{
					$("#username").css("border","1px solid red");
				}
                return flag;
            }

            function checkPassword() {
                var password = $("#password").val();
                var reg_password = /^\w{1,20}$/;
                var flag = reg_password.test(password);
                if(flag){
                    $("#password").css("border","");
                }else{
                    $("#password").css("border","1px solid red");
                }
                return flag;
            }
			$(function () {
				$("#username").blur(checkUsername);
                $("#password").blur(checkPassword);
            });
		</script>
    </head>
	<body>
	<div id="header"></div>
	<div class="rg_layout">
		<div class="rg_form clearfix">
			<div class="rg_form_left">
				<p>管理员注册</p>
				<p>ADMIN REGISTER</p>
			</div>
			<div class="rg_form_center">

				<form action="admin/addAdmin" method="post">
					<input type="hidden" name="action" value="register">
					<table style="margin-top: 25px;">
						<tr>
							<td class="td_left">
								<label for="username">用户名</label>
							</td>
							<td class="td_right">
								<input type="text" id="username" name="username" placeholder="请输入账号">
							</td>
						</tr>
						<tr>
							<td class="td_left">
								<label for="password">密码</label>
							</td>
							<td class="td_right">
								<input type="text" id="password" name="password" placeholder="请输入密码">
							</td>
						</tr>

						<tr>
							<td class="td_left">
							</td>
							<td class="td_right check">
								<input type="submit" class="submit" value="注册">
								<span id="msg" style="color: red;"></span>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="rg_form_right">
				<p>
					已有账号？
					<a href="login.jsp">立即登录</a>
				</p>
			</div>
		</div>
	</div>
	</body>
</html>
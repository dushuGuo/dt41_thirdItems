<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String context = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+context+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>退出登录</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <meta http-equiv="refresh" content="3;./login.jsp">
 <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<%=basePath %>/resource/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=basePath %>/resource/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=basePath %>/resource/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=basePath %>/resource/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<%=basePath %>/resource/css/blue.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <!-- jQuery 3 -->
	<script src="<%=basePath %>/resource/js/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="<%=basePath %>/resource/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="<%=basePath %>/resource/js/icheck.min.js"></script>
	<script src="<%=basePath %>/resource/js/gVerify.js"></script>
</head>
<body class="hold-transition register-page">
    <center>
        <div class="alert alert-success alert-dismissible" style="width: 300px;height: 100px;margin-top:200px">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4>提示</h4>
                   <p>您已经成功退出登录</p>
                   <p>3秒钟之后将为您跳转到登录页面</p>
                    
        </div>
     </center>
  </body>
  </html>
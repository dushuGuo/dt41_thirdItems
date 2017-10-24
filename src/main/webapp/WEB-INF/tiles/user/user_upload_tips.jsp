<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <title>上传结果页面</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
 <body>
    <center>
        <div class="alert alert-success alert-dismissible" style="width: 300px;height: auto">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4>提示</h4>
                <ul>
	                <c:forEach items="${tipinfo }" var="info">
	                	<li style="list-style-type:none">${info }</li>
	                </c:forEach>
                </ul>
                   <a href="javascript:void(0)" onclick="javascript :history.back(-1);">点此返回</a>
        </div>
    </center>
 </body>
</html>
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
  <title>忘记密码</title>
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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=basePath %>/resource/css/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<!-- ADD THE CLASS fixed TO GET A FIXED HEADER AND SIDEBAR LAYOUT -->
<!-- the fixed layout is not compatible with sidebar-mini -->
<body class="hold-transition skin-blue fixed sidebar-mini" >

  <div class="content-wrapper" style="width: 100%;margin-left: 0px">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    <center>
      <h1>安全中心</h1>
    </center>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 登录</a></li>
        <li class="active">安全中心</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="callout callout-info">
        <h4>提示！</h4>

        <p>如果您忘记了密码，请输入手机号码，通过短信验证，点击申请找回密码，后台管理人员会根据您的申请核实情况，如果情况属实，会以邮件的形式将密码发送到您的邮箱，请注意查看。</p>
      </div>
      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          

          

          <center>
            <form action="./login.html" method="post">
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号码：<input type="text" name="phone" placeholder="请输入手机号码"></p>
              <p>
                 <input type="button" value="获取验证码">
                 <input type="text" name="yanZM">
              </p>
              <input type="submit" value="申请找回密码">
            </form>
          </center>
        </div>
       
      
        
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
 
 
  
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="<%=basePath %>/resource/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=basePath %>/resource/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="<%=basePath %>/resource/js/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=basePath %>/resource/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=basePath %>/resource/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=basePath %>/resource/js/demo.js"></script>
</body>
</html>

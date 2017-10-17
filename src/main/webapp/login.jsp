<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>   
<%
	String context=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+context+"/";
%>
<!DOCTYPE html>
<html style="height: 500px;">
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>登录</title>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <style type="text/css">
      #code_input{
        width: 200px;
        height: 34px;
      }
    </style>
</head>
<body style="background:url(resource/images/login_bg.jpg);height: 500px;">

<div class="login-box">
  <div class="login-logo">
    <a href="#" style="color: white;font-family: Microsoft YaHei;"><b>登&nbsp;录</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body" style="background-color: rgba(54,167,129,.4);">
    <form action="<%=basePath %>/login.shtml" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="请输入手机号码"  name="phone">
       <!--  <input type="text" class="form-control" placeholder="请输入手机号码"  pattern="1[34578]\d{9}" required="required"  name="phone"> -->
        <span style="display: block;margin-top: -30px;margin-left: 291px"><img src="<%=basePath %>/resource/images/iphone.png" style="width: 27px;height: 25px"></span>
      </div>
      <div class="form-group has-feedback">
        <!-- <input type="password" class="form-control" placeholder="请输入密码"  pattern="[0-9a-zA-Z]{8,16}" required="required"  name="password"> -->
         <input type="password" class="form-control" placeholder="请输入密码"   name="password">
        <span style="display: block;margin-top: -30px;margin-left: 293px"><img src="<%=basePath %>/resource/images/locked.png" style="width: 20px;height: 25px"></span>
      </div>
      
      <div class="form-group has-feedback">
          <div>
             <input type="text" class="form-control" name="code2" id="code_input"  placeholder="请输入验证码" style="width: 140px;float: left">
          </div>
          <div id="v_container" name="code2" style="width: 150px;height: 40px;float: left;margin-left: 20px"><img src="getYzm.shtml"></div>
      </div>
		 <div class="col-xs-8">
          <div class="checkbox icheck" style="margin-left:10px">
            <label>
              <input type="checkbox" name="onLine" value="3"> <span style="color:#272822">下次自动登录</span>
            	<div><span style="color:yellow">${erroMessage} </span></div>
            </label>
          </div>   
        </div>
       <div class="col-xs-4" style="width: 320px;margin-top: 1px">
          <button type="submit" class="btn btn-primary btn-block btn-flat" style="font-size: 16px;">登录</button>
        </div>
      <div class="row">
       
        <!-- /.col -->
        <div class="col-xs-4" style="font-size: 14px;margin-top: 7px;margin-left:250px;">
            <a href="<%=basePath %>/pages/register.jsp" class="text-center" style="color: #FFFFFF">申请合作</a>
        </div>

       <%--   <div class="col-xs-4" style="font-size: 14px;margin-top: 7px;margin-left:105px">
           <a href="<%=basePath %>/pages/wangjimima.jsp" class="text-center" style="color: #FFFFFF">忘记密码</a>
        </div> --%>
        
        <!-- /.col -->
      </div>
    </form>

    
    <!-- /.social-auth-links -->

    
    

  </div>
  <!-- /.login-box-body -->
</div>

    
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="<%=basePath %>/resource/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=basePath %>/resource/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<%=basePath %>/resource/js/icheck.min.js"></script>
<script src="<%=basePath %>/resource/js/gVerify.js"></script>


<script>
$("#v_container").find("img").click(function(){
var $img=	$(this);
	$(this).attr("src","");
	$.post("getYzm.shtml", function(data) {
		$img.attr("src","getYzm.shtml") 
		});
})
  </script>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
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
      input{
        width: 200px;
        height: 34px;
      }
    </style>
</head>
<body style="background:url(resource/images/login_bg.jpg);height: 500px;">

<div class="login-box">
  <div class="login-logo">
    <a href="#" style="color: white;font-family: Microsoft YaHei;"><b>添&nbsp;加&nbsp;账&nbsp;号</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body" style="background-color: rgba(54,167,129,.4); height: 370px;">
    <form action="<%=basePath%>/insertAdminReg.shtml" method="post">
      <div class="form-group has-feedback">
         <input type="text" name="phone" placeholder="&emsp;请输入手机号" pattern="[1]([3]|[5]|[7]|[8])\d{9}" required="required" style="width: 320px;">
        <span style="display: block;margin-top: -26px;margin-left: 291px"><img src="<%=basePath %>/resource/images/iphone.png" style="width: 27px;height: 25px"></span>
      </div>
       <div class="form-group has-feedback">
         <input type="text" name="name" placeholder="&emsp;请输入姓名" required="required" style="width: 320px;">
        <span style="display: block;margin-top: -26px;margin-left: 291px"><img src="<%=basePath %>/resource/images/ios7-contact-outline.png" style="width: 27px;height: 25px"></span>
      </div>
      <div class="form-group has-feedback">
         <input type="text" name="job" placeholder="&emsp;请输入职业" required="required" style="width: 320px;">
        <span style="display: block;margin-top: -26px;margin-left: 291px"><img src="<%=basePath %>/resource/images/social-wordpress.png" style="width: 27px;height: 25px"></span>
      </div>
      <div class="form-group has-feedback">
         <input type="email" name="email" placeholder="&emsp;请输入email" required="required" style="width: 320px;">
        <span style="display: block;margin-top: -26px;margin-left: 291px"><img src="<%=basePath %>/resource/images/ios7-email.png" style="width: 27px;height: 25px"></span>
      </div>
         <div class="form-group has-feedback">
         <input type="password" class="form-control" placeholder="请输入密码"   name="password">
        <span style="display: block;margin-top: -30px;margin-left: 293px"><img src="<%=basePath %>/resource/images/locked.png" style="width: 20px;height: 25px"></span>
      </div>
      <span id="mess" style="color: red; display: block; text-align: right;"></span>
      <div class="form-group has-feedback">      
         <input type="password" class="form-control" placeholder="请输入确认密码"   name="password1">
        <span style="display: block;margin-top: -30px;margin-left: 293px"><img src="<%=basePath %>/resource/images/checkmark.png" style="width: 20px;height: 25px"></span>
      </div>     
      <div><span style="color:red" id="erroMessage"></span></div>
       <div class="col-xs-4" style="width: 320px;margin-top: 1px">
          <button type="submit" class="btn btn-primary btn-block btn-flat" style="font-size: 16px;">确认添加</button>
        </div>
       
        <!-- /.col -->
<%--         <div class="col-xs-4" style="font-size: 14px;margin-top: 7px;margin-left:250px;">
            <a href="<%=basePath %>/pages/register.jsp" class="text-center" style="color: #FFFFFF">申请合作</a>
        </div> --%>

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
<script type="text/javascript">
	$("input[name=password1]").blur(function(){
		var password=$("input[name=password]").val();
		var password1=$("input[name=password1]").val();
		if(password!=password1){
			$("#mess").html("*亲，两次输入的密码不一致！");
		}else{
			$("#mess").html("");
		}		
	});
</script>

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

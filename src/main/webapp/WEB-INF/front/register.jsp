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
  <title>用户注册</title>
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


.state {
	width: 280px;
	height: 40px;
	position: absolute;
	top: 300px;
	left: 545px;
	index: 1000;
	font-style: italic;
	text-align: center;
	padding-top: 20px;
	text-align: center;
	padding-top: 20px;
	background-color: white;
}


.state span {
	color: gray;
	font-size: 30px;
}

    </style>
</head>
<body class="hold-transition register-page" style="background:url(<%=basePath%>/resource/images/beijing2.jpg)">
<div class="register-box">
  <div class="register-logo">
    <a href="#" style="margin-left: 50px"><b>账号信息登记</b></a>
  </div>

  <div class="register-box-body" style="width: 390px">

    <form action="<%=basePath %>/register.shtml" method="post">
      <div class="form-group has-feedback">

        <sapn style="display: block;margin-bottom: -30px">*企业名称： </sapn>
              <input type="text" class="form-control" style="width: 270px;margin-left: 85px"  placeholder="请输入企业名称" name="corpname" required="required">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
              <img src="<%=basePath %>/resource/images/ios7-world.png" style="width: 27px;height: 25px">
        </span>
      </div>
      <div class="form-group has-feedback" style="margin-top: 30px">

        <sapn style="display: block;margin-bottom: -30px">*联系人姓名： </sapn>
             <input type="text" class="form-control" style="width: 270px;margin-left: 85px" placeholder="请输入联系人姓名" name="name" required="required">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
             <img src="<%=basePath %>/resource/images/ios7-contact-outline.png" style="width: 27px;height: 25px">
        </span>
      </div>

      <div class="form-group has-feedback" style="margin-top: 30px">

        <sapn style="display: block;margin-bottom: -30px">*联系人职务： </sapn>
            <input type="text" class="form-control" style="width: 270px;margin-left: 85px" placeholder="请输入联系人职务" name="job" required="required">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
            <img src="<%=basePath %>/resource/images/social-wordpress.png" style="width: 27px;height: 25px">
        </span>
      </div>
		
      <div class="form-group has-feedback" style="margin-top: 30px">

        <sapn style="display: block;margin-bottom: -30px">*手机号码： </sapn>
            <input type="text" class="form-control" style="width: 270px;margin-left: 85px" placeholder="请输入手机号码" name="phone"  required="required" pattern="^((13[0-9])|(15[^4,\D])|(18[0,5-9]))\d{8}$">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
            <img src="<%=basePath %>/resource/images/iphone.png" style="width: 27px;height: 25px">
        </span>
       
      </div>
       <span id="ph" style="color:red"></span>
      <div class="form-group has-feedback" style="margin-top: 30px">
       <sapn style="display: block;margin-bottom: -30px">*邮箱地址： </sapn>
            <input type="email" class="form-control" style="width: 270px;margin-left: 85px" placeholder="请输入邮箱地址" name="email" required="required" pattern="^([a-z0-9A-Z]+[-|\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
            <img src="<%=basePath %>/resource/images/ios7-email.png" style="width: 27px;height: 25px">
        </span>
      </div>
       <span id="php" style="color:red"></span>
      <div class="form-group has-feedback" style="margin-top: 30px">
        <sapn style="display: block;margin-bottom: -30px">*密码： </sapn>
            <input type="password" class="form-control" style="width: 270px;margin-left: 85px" placeholder="请输入密码" name="password" pattern="[0-9a-zA-Z]{8,16}" required="required">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
            <img src="<%=basePath %>/resource/images/locked.png" style="width: 27px;height: 25px">
        </span>
      </div>
      <span id="mess" style="color:red"></span>
      <div class="form-group has-feedback" style="margin-top: 30px">
        <sapn style="display: block;margin-bottom: -30px">*确认密码： </sapn>
            <input type="password" class="form-control" style="width: 270px;margin-left: 85px" placeholder="请输入确认密码" name="password1" pattern="[0-9a-zA-Z]{8,16}" required="required">
         <span style="display: block;margin-top: -30px;margin-left: 320px">
             <img src="<%=basePath %>/resource/images/checkmark.png" style="width: 27px;height: 25px">
        </span>
      </div>

      <div class="form-group has-feedback">
          <div>
             <input type="text" class="form-control" id="code_input"  placeholder="请输入验证码" style="width: 140px;float: left" required="required">
          </div>
          <div id="v_container" style="width: 150px;height: 40px;float: left;margin-left: 60px"></div>
        
      </div>
      <div class="row" style="margin-top: 10px">
        <div class="col-xs-8">
          <div class="checkbox icheck" style="margin-left:20px">
            <label>
              <input type="checkbox" name="xieyi" value="1"> 我同意 <a href="<%=basePath %>/pages/yonghuxieyi.jsp">用户协议</a>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4" style="margin-top: 10px">
          <input type="submit" name="zuce" value="申请注册" class="btn btn-primary btn-block btn-flat" disabled="disabled"/>
        </div>
        <!-- /.col -->
      </div>
        
    </form>

   

    <a href="<%=basePath %>/login.jsp" class="text-center">我已经有账号</a>
  </div>
<div class="state">
			<span>${error }</span>
		</div> 
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="<%=basePath %>/resource/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=basePath %>/resource/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<%=basePath %>/resource/js/icheck.min.js"></script>
<script src="<%=basePath %>/resource/js/gVerify.js"></script>


<script>
$(".state").hide();
    var verifyCode = new GVerify("v_container");
    document.getElementById("code_input").onblur = function(){
      var res = verifyCode.validate(document.getElementById("code_input").value);
      if(!res){
        alert("验证码错误");
      }
    }          
  </script>
  <script>
$(document).ready(function(){
    var countdown=1;
   
    if(${msg==0}){
    	
  
        $(".state").show(function settime() { 
    	 
         if (countdown == 0) { 		        
        	window.location.href="<%=basePath%>/pages/register.jsp";
            return;
        } else { 		        		       
            countdown--; 
        } 
    setTimeout(function() { 
        settime(); }
        ,1000);
    
        });
    }
        })
  </script>
 <script type="text/javascript">
 	$("input[name=password1]").blur(function(){
 		var pass=$("input[name=password]").val();
 		var pass1=$("input[name=password1]").val();
 		if(pass!=pass1){
 			$("#mess").html("*亲，您两次输入的密码不一致！");
 			
 		}else{
 			$("#mess").html("");
 		}
 	});
 	
 	$("input[name=xieyi]").click(function(){
 	var result=	$("input[name=xieyi]").val()
 		if(result=="1"){
 			
 		   $("input[name=zuce]").removeAttr("disabled")
 		   $("input[name=xieyi]").val("0");
 			
 			
 		}
 		else if(result=="0"){
 			$("input[name=zuce]").attr("disabled","disabled") 	
 			$("input[name=xieyi]").val("1");
 			
 		}
 	  
 		
 	})
 </script>
 <script type="text/javascript">
 	$("input[name=phone]").blur(function(){
 		$.ajax({
 			
 			url:"<%=basePath %>/testPhone.shtml",
 			type:"post",
 			data:{
 				phone:$("input[name=phone]").val()
 			},
 			dataType:"json",
 			success:function(result){
 				var phnum=result.num;
 				var errormess=result.error;
 				if(phnum==1){
 					$("#ph").html(errormess);
 				}else{
 					$("#ph").html(errormess);
 				}
 			}
 		})
 	});
 	$("input[name=email]").blur(function(){
 		
 		$.ajax({
 			
 			url:"<%=basePath %>/testEmail.shtml",
 			type:"post",
 			data:{
 				email:$("input[name=email]").val()
 			},
 			dataType:"json",
 			success:function(result){
 				var phnum=result.num;
 				var errormess=result.error;
 				if(phnum==1){
 					$("#php").html(errormess);
 				}else{
 					$("#php").html(errormess);
 				}
 			}
 		})
 	});
 </script>
 
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    var verifyCode = new GVerify("v_container");

    document.getElementById("code_input").onblur = function(){
      var res = verifyCode.validate(document.getElementById("code_input").value);
      if(!res){
        alert("验证码错误");
      }
    }
  
</script>
<script type="text/javascript">
	$("input[name=password1]").blur(function(){
		var pass=$("input[name=password]").val();
		var pass1=$("input[name=password1]").val();
		if(pass!=pass1){
			$("#error").html("*两次密码输入不一致！");
		}else{
			$("#error").html("");
		}
	});
</script>
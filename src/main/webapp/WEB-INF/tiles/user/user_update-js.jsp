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
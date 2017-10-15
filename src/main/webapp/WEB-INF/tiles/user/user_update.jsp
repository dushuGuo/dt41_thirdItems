<%@ page contentType="text/html;charset=UTF-8" language="java" import="cn.bdqn.datacockpit.entity.Companyinfo" isELIgnored="false"%>

  <!-- Content Header (Page header) -->
   <!--  <section class="content-header">
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 个人中心</a></li>
        <li class="active">资料修改</li>
      </ol>
    </section> -->

    <!-- Main content -->
    <section class="content container-fluid" style="background:url(resource/images/pic5.jpg);width: 100%;height:100%">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
  <div class="register-box" >
  <div class="register-logo">
    <a href="#" style="margin-left: 50px"><b>资料修改</b></a>
  </div>

  <div class="register-box-body" style="width: 390px">
    

    <form action="./updateInfo1.shtml" method="post">
      <div class="form-group has-feedback">
		<input type="hidden" name="corpname" value="${comp.corpname }">
		<input type="hidden" name="id" value="${comp.id }">
        <sapn style="display: block;margin-bottom: -30px">企业名称： </sapn>
              <input type="text" class="form-control" disabled="disabled" style="width: 270px;margin-left: 85px;" value="${comp.corpname }">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
              <img src="resource/images/ios7-world.png" style="width: 27px;height: 25px">
        </span>
      </div>
      <div class="form-group has-feedback" style="margin-top: 30px">

        <sapn style="display: block;margin-bottom: -30px">联系人姓名： </sapn>
             <input type="text" class="form-control" style="width: 270px;margin-left: 85px"  name="name" value="${comp.name }">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
             <img src="resource/images/ios7-contact-outline.png" style="width: 27px;height: 25px">
        </span>
      </div>

      <div class="form-group has-feedback" style="margin-top: 30px">

        <sapn style="display: block;margin-bottom: -30px">联系人职务： </sapn>
            <input type="text" class="form-control" style="width: 270px;margin-left: 85px"  name="job" value="${comp.job }">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
            <img src="resource/images/social-wordpress.png" style="width: 27px;height: 25px">
        </span>
      </div>

      <div class="form-group has-feedback" style="margin-top: 30px">

        <sapn style="display: block;margin-bottom: -30px">手机号码： </sapn>
            <input type="text" class="form-control" style="width: 270px;margin-left: 85px"  name="phone" value="${comp.phone }">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
            <img src="resource/images/iphone.png" style="width: 27px;height: 25px">
        </span>
      </div>
      <div class="form-group has-feedback" style="margin-top: 30px">
        <sapn style="display: block;margin-bottom: -30px">邮箱地址： </sapn>
            <input type="email" class="form-control" style="width: 270px;margin-left: 85px"  name="email" value="${comp.email }">
        <span style="display: block;margin-top: -30px;margin-left: 320px">
            <img src="resource/images/ios7-email.png" style="width: 27px;height: 25px">
        </span>
      </div>
      

      <div class="form-group has-feedback">
          <div>
             <input type="text" class="form-control" id="code_input"  placeholder="请输入验证码" style="width: 140px;float: left">
          </div>
          <div id="v_container" style="width: 150px;height: 40px;float: left;margin-left: 60px"><img src="getYzm.shtml"></div>
        
      </div>
      <div class="row" style="margin-top: 20px">
        
        <!-- /.col -->
        <div class="col-xs-4" style="margin-top: 10px;width: 380px">
          <button type="submit" class="btn btn-primary btn-block btn-flat">立即修改</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

   

    
  </div>
  <!-- /.form-box -->
</div>

    </section>
<%@ page language="java" contentType="text/html; charset=utf-8" import="cn.bdqn.datacockpit.entity.Companyinfo"
    pageEncoding="utf-8" isELIgnored="false"%>
  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="./user_second.shtml" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>数据</b>舱</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>数据</b>驾驶舱</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
                 
        <ul class="nav navbar-nav">
          <li><a href="./user_second.shtml">返回首页</a></li>
          <li><a href="./updatePassword.shtml">修改密码</a></li>
          <li><a href="./exit.shtml">退出登录</a></li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/yonghu.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${infos.name }&emsp;${infos.job }(${infos.corpname })</p>
          
          <!-- Status -->
          <!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
        </div>
      </div>

      <!-- search form (Optional) -->
     <!--  <form action="#" method="get" class="sidebar-form">
       <div class="input-group">
         <input type="text" name="q" class="form-control" placeholder="Search...">
         <span class="input-group-btn">
             <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
             </button>
           </span>
       </div>
     </form> -->
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header"></li>
        <!-- Optionally, you can add icons to the links -->

        <li class="active"><a href="./selectTongzhi.shtml"><i class="fa fa-link"></i> <span>通知中心</span></a></li>

        <li class="treeview gerens">
          <a href="#"><i class="fa fa-link"></i> <span>个人中心</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="geren1"><a href="./updateInfo.shtml?phone=${infos.phone }">&emsp;<i class="fa fa-genderless"></i>资料修改</a></li>
            <li class="geren2"><a href="./updatePassword.shtml">&emsp;<i class="fa fa-genderless"></i>修改密码</a></li>
          </ul>
        </li>

        <li class="treeview shujus">
          <a href="#"><i class="fa fa-link"></i> <span>数据管理</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="shuju4"><a href="./user_guanxitu.shtml">&emsp;<i class="fa fa-genderless"></i>数据关系图</a></li>
            <li class="shuju1"><a href="./user_shuju1.shtml">&emsp;<i class="fa fa-genderless"></i>分析任务列表</a></li>
            <li class="shuju2"><a href="./user_shuju2.shtml">&emsp;<i class="fa fa-genderless"></i>数据列表</a></li>
          </ul>
        </li>

      </ul>
      <!-- /.sidebar-menu -->
    </section>
   <!-- /.sidebar -->
   <script type="text/javascript">
    	var checks="${checks}"
    	localStorage.shuju1="shuju1";
    	localStorage.shuju2="shuju2";
    	localStorage.shuju3="shuju3";
    	localStorage.shuju4="shuju4";
    	localStorage.geren1="geren1";
    	localStorage.geren2="geren2";
    	if(checks == localStorage.shuju1){
    		$("ul li").removeClass("active")
    		$(".shujus").addClass("active")
    		$(".shuju1").addClass("active")
    	}
    	if(checks == localStorage.shuju2){
    		$("ul li").removeClass("active")
    		$(".shujus").addClass("active")
    		$(".shuju2").addClass("active")
    	}
    	if(checks == localStorage.shuju3){
    		$("ul li").removeClass("active")
    		$(".shujus").addClass("active")
    		$(".shuju3").addClass("active")
    	}
    	if(checks == localStorage.shuju4){
    		$("ul li").removeClass("active")
    		$(".shujus").addClass("active")
    		$(".shuju4").addClass("active")
    	}
    	if(checks == localStorage.geren1){
    		$("ul li").removeClass("active")
    		$(".gerens").addClass("active")
    		$(".geren1").addClass("active")
    	}
    	if(checks == localStorage.geren2){
    		$("ul li").removeClass("active")
    		$(".gerens").addClass("active")
    		$(".geren2").addClass("active")
    	}
    	if(checks == localStorage.shuju4){
    		$("ul li").removeClass("active")
    		$(".shujus").addClass("active")
    		$(".shuju4").addClass("active")
    	}
    </script>
  </aside>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
     
<!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="./selectAllCompanyinfo.shtml" class="logo">
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
          <li><a href="./admin_uppassword.shtml">修改密码</a></li>
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
          <img src="dist/img/manager.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${infos.name }&emsp;${infos.job }</p>
          <a><i class="fa fa-circle text-success"></i> 在线</a>
      
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
        <li class="shenhe"><a href="./admin_userDsh.shtml"><i class="fa fa-link"></i> <span>待审核用户列表</span></a></li>
        <li class="tongzhi" ><a href="./admin_tongzhi1.shtml"><i class="fa fa-link"></i> <span>通知管理</span></a></li>
<!--         <c:hasRole name="supereme"><li class="zhanghao" ><a href="./admin_shuju4.shtml"><i class="fa fa-link"></i> <span>后台账号管理</span></a></li></c:hasRole> -->
        <li class="zhanghao" ><a href="./admin_shuju4.shtml"><i class="fa fa-link"></i> <span>后台账号管理</span></a></li>
<!--         <li class="yonghu" ><a href="./admin_userMan.shtml"><i class="fa fa-link"></i> <span>用户管理</span></a></li> -->
        <li class="qiye treeview1">
          <a href="./admin_cominfo.shtml"><i class="fa fa-link"></i> <span>企业数据管理</span>
            <span class="pull-right-container">
                <!-- <i class="fa fa-angle-left pull-right"></i> -->
                 <i class="aaaabbb"></i>
            </span>
          </a>
          <!-- <ul class="treeview-menu">
            <li><a href="./admin_shuju1.shtml">&emsp;<i class="fa fa-genderless"></i>碧桂园房地产开发有限公司</a></li>
            <li><a href="./admin_shuju1.shtml">&emsp;<i class="fa fa-genderless"></i>万科房地产开发有限公司</a></li>
            <li><a href="./admin_shuju1.shtml">&emsp;<i class="fa fa-genderless"></i>万达房地产开发有限公司</a></li>
          </ul> -->
        </li>

      </ul>
      <script type="text/javascript">
      	var menus = ${menus}
      	localStorage.menu1="1";
      	localStorage.menu2="2";
      	localStorage.menu3="3";
      	localStorage.menu4="4";
      	localStorage.menu5="5";
      	if(menus == localStorage.menu5){
			$(".shenhe").addClass("active");
			$("ul li").not($(".shenhe")).removeClass("active");
		}
		if(menus == localStorage.menu1){
			$(".tongzhi").addClass("active");
			$("ul li").not($(".tongzhi")).removeClass("active");
		}
		if(menus == localStorage.menu2){
			$(".zhanghao").addClass("active");
			$("ul li").not($(".zhanghao")).removeClass("active");
		}
		if(menus == localStorage.menu3){
			$(".qiye").addClass("active");
			$("ul li").not($(".qiye")).removeClass("active");
		}
		if(menus == localStorage.menu4){
			$(".yonghu").addClass("active");
			$("ul li").not($(".yonghu")).removeClass("active");
		}
		if(menus == localStorage.menu4){
			$(".yonghu").addClass("active");
			$("ul li").not($(".yonghu")).removeClass("active");
		}
      	</script>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

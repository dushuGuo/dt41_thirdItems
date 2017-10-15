<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       数据关联关系
      </h1>
    </section>
		<script type="text/javascript" src="bower_components/jquery/dist/jquery-1.4.2.js"></script>
		<link rel="stylesheet" type="text/css" href="bower_components/joint-1/joint.css" />
        <script src="bower_components/joint-1/jquery-3.1.1.js"></script>
        <script src="bower_components/joint-1/lodash-3.10.1.js"></script>
        <script src="bower_components/joint-1/backbone-1.3.3.js"></script>
        <script src="bower_components/joint-1/joint.js"></script>
	<style type="text/css">
		ul {
			list-style-type: none;
			}
		li{
			margin-right: 10px;
		}
        .choose{
            float: left;
            width: 120px;
            height: 30px;
            border-radius:10px;
            color: white;
        }
		#paper{
			/* border:3px solid #001f3f; */
			float: left;
			background: #ECF0F5;
			margin-left: 140px;
			margin-top:20px;
		}	
	</style>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <ul id="table">
			<!-- <li><input type="button" class="choose" value="销售数据表" style="background:#f56954"></li>
			<li><input type="button" class="choose" value="到访数据表" style="background:#f39c12"></li>
			<li><input type="button" class="choose" value="轮班数据表" style="background:#00a65a"></li>
			<li><input type="button" class="choose" value="派单数据表" style="background:#605ca8"></li>
			<li><input type="button" class="choose" value="认筹数据表" style="background:#d81b60"></li>
			<li><input type="button" class="choose" value="中介数据表" style="background:#39cccc"></li>
			<li><input type="button" class="choose" value="媒体渠道数据表" style="background:#3c8dbc"></li> -->
		</ul>      
		<div id="paper" class="paper"></div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
    

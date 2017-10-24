
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String context = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+context+"/";
%>

<base href="<%=basePath %>">
<!-- Content Header (Page header) -->
<!-- 折线图的在线Js -->

<script src="http://s1.bdstatic.com/r/www/cache/ecom/esl/1-6-10/esl.js"></script>
  <link rel="stylesheet" href="<%=basePath %>/js/easyui.css">
  <link rel="stylesheet" href="<%=basePath %>/js/icon.css">
  <script src="<%=basePath %>/js/jquery.easyui.min.js"></script>
  <script src="<%=basePath %>/js/jquery.min.js"></script>
  <script src="<%=basePath %>/js/easyui-lang-zh_CN.js"></script>

   
<section class="content-header">
	<h1 style="font-weight: bolder;">快捷菜单</h1>
</section>



<!-- Main content -->
<section class="content">
	<!-- Small boxes (Stat box) -->
	<div class="row">
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-red">
				<div class="inner">
					<h3>上传数据</h3>

					<h5>New Users</h5>
				</div>
				<div class="icon">
					<img src="resource/images/1.png" />
				</div>
				<a href="./user_shuju2.shtml" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-green">
				<div class="inner">
					<h3>启动新任务</h3>

					<h5>New Account</h5>
				</div>
				<div class="icon">
					<img src="resource/images/2.png" />
				</div>
				<a href="./user_shuju1.shtml" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->

		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>数据关联关系</h3>

					<h5>New Notification</h5>
				</div>
				<div class="icon">
					<img src="resource/images/3.png" />
				</div>
				<a href="./user_guanxitu.shtml" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-aqua">
				<div class="inner">
					<H3>任务状态</H3>

					<h5>New Data-table</h5>
				</div>
				<div class="icon">
					<img src="resource/images/33.png" />
				</div>
				<a href="./user_shuju1.shtml" class="small-box-footer">More info <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<!-- ./col -->
	</div>
	<!-- 快捷菜单以上 -->

	<!-- 通知信息以下 -->

	<!-- TABLE: LATEST ORDERS -->
	<div class="box box-info" style="width: 98%;">
		<div class="box-header with-border">
			<h3 class="box-title" style="font-weight: bolder;">通知信息</h3>

			<div class="box-tools pull-right">
				<button type="button" class="btn btn-box-tool"
					data-widget="collapse">
					<i class="fa fa-minus"></i>
				</button>
				<!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
			</div>
		</div>
		<!--   /.box-header -->
		<div class="box-body">
			<div class="table-responsive">
				<div id=tz>
					<ul>
						<cc:forEach items="${flag }" var="map" begin="0" end="4">
					
						<li class=tz1><a href="./gongGao.shtml?id=${map.info.id }">${map.info.title }  -----------【<fmt:formatDate value="${map.info.publishDate }" pattern="yyyy-MM-dd"/>】</a>
						<cc:if test="${map.date==1 }">
						<img src="resource/images/6.png" />
						</cc:if>
						</li>
						</cc:forEach>

					</ul>
				</div>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.box-body -->
		<div class="box-footer clearfix">
			<a href="javascript:void(0)"
				class="btn btn-sm btn-default btn-flat pull-right">more >></a>
		</div>
		<!-- /.box-footer -->
	</div>
	<!-- /.box -->
	<!-- 通知信息以上 -->

	
<!-- 折线图 -->
 <input type="text" name="shows" value="${infos.id }" hidden>
 <center><input type="text" name="begintime">开始时间 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="endtime">结束时间
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button" value="提交"></center>

<center><h3>${infos.corpname }数据显示表</h3></center>
<div id="main" style="height:400px"></div>
<script type="text/javascript">
var myChart;
        // 路径配置
        require.config({
            paths:{ 
                'echarts' : 'http://echarts.baidu.com/build/echarts',
                'echarts/chart/bar' : 'http://echarts.baidu.com/build/echarts'
            }
        });
        
     // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                myChart = ec.init(document.getElementById('main')); 
    	  }
      );
        var  option =  {
	            title : {
	            text: '',
	            subtext: '纯属虚构'
	            },
	            tooltip : {
	            trigger: 'axis'
	            },
	            legend: {
	            data:['到访人数','退订人数','认筹人数']
	            },
	            toolbox: {
	            show : true,
	            feature : {
	                mark : {show: true},
	                dataView : {show: true, readOnly: false},
	                magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	                restore : {show: true},
	                saveAsImage : {show: true}
	            }
	            },
	            calculable : true,
	            xAxis : [
	            {
	                type : 'category',
	                boundaryGap : false,
	                data : []
	            }
	            ],
	            yAxis : [
	            {
	                type : 'value'
	            }
	            ],
	            series : [
	            {
	                name:'到访人数',
	                type:'line',
	                smooth:true,
	                itemStyle: {normal: {areaStyle: {type: 'default'}}},
	                data:[]
	            },
	           
	          
	            ]
	           
	            };
      $("input[name=button]").click(function(){
        $.ajax({
            type : "post",
            async : false, //同步执行  
            url : "selectXiaoShouBiao.shtml",
            data : {
            	begintime:$("input[name=begintime]").val(),  
            	endtime:$("input[name=endtime]").val(),
            	shows:$("input[name=shows]").val(),
           },
            dataType : "json", //返回数据形式为json  
            success : function(result) {
            	if(result){
            	        /*     为echarts对象加载数据  */
            	     option.legend.data = result.legend;
                     option.xAxis[0].data = result.category;
                     option.series[0].data = result.series[0].data;
                     myChart.hideLoading();
                     myChart.setOption(option);
                     myChart.hideLoading();
            	}
            } ,
            error:function(errorMeg){
            	alert("图表请求失败！")
            	 myChart.showLoading();
            }
         });
    	});  
  
    </script> 
<!-- 折线图 -->
</section>
<!-- /.content -->


<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Content Header (Page header) -->
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
	<!-- 数据展示以下  -->
	<div class="row">
		<div class="col-md-12">
			<div class="box" style="border-top-color: red">
				<div class="box-header with-border">
					<h3 class="box-title" style="font-weight: bolder;">数据展示</h3>

					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>

					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="row">
						<div class="col-md-8">
							<p class="text-center">
								<strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
							</p>

							<div class="chart">
								<!-- Sales Chart Canvas -->
								<canvas id="salesChart" style="height: 180px;"></canvas>
							</div>
							<!-- /.chart-responsive -->
						</div>
						<!-- /.col -->
						<div class="col-md-4">
							<p class="text-center">
								<strong>Goal Completion</strong>
							</p>

							<div class="progress-group">
								<span class="progress-text">Add Products to Cart</span> <span
									class="progress-number"><b>160</b>/200</span>

								<div class="progress sm">
									<div class="progress-bar progress-bar-aqua" style="width: 80%"></div>
								</div>
							</div>
							<!-- /.progress-group -->
							<div class="progress-group">
								<span class="progress-text">Complete Purchase</span> <span
									class="progress-number"><b>310</b>/400</span>

								<div class="progress sm">
									<div class="progress-bar progress-bar-red" style="width: 80%"></div>
								</div>
							</div>
							<!-- /.progress-group -->
							<div class="progress-group">
								<span class="progress-text">Visit Premium Page</span> <span
									class="progress-number"><b>480</b>/800</span>

								<div class="progress sm">
									<div class="progress-bar progress-bar-green" style="width: 80%"></div>
								</div>
							</div>
							<!-- /.progress-group -->
							<div class="progress-group">
								<span class="progress-text">Send Inquiries</span> <span
									class="progress-number"><b>250</b>/500</span>

								<div class="progress sm">
									<div class="progress-bar progress-bar-yellow"
										style="width: 80%"></div>
								</div>
							</div>
							<!-- /.progress-group -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- ./box-body -->
				<div class="box-footer">
					<div class="row">
						<div class="col-sm-3 col-xs-6">
							<div class="description-block border-right">
								<span class="description-percentage text-green"><i
									class="fa fa-caret-up"></i> 17%</span>
								<h5 class="description-header">$35,210.43</h5>
								<span class="description-text">TOTAL REVENUE</span>
							</div>
							<!-- /.description-block -->
						</div>
						<!-- /.col -->
						<div class="col-sm-3 col-xs-6">
							<div class="description-block border-right">
								<span class="description-percentage text-yellow"><i
									class="fa fa-caret-left"></i> 0%</span>
								<h5 class="description-header">$10,390.90</h5>
								<span class="description-text">TOTAL COST</span>
							</div>
							<!-- /.description-block -->
						</div>
						<!-- /.col -->
						<div class="col-sm-3 col-xs-6">
							<div class="description-block border-right">
								<span class="description-percentage text-green"><i
									class="fa fa-caret-up"></i> 20%</span>
								<h5 class="description-header">$24,813.53</h5>
								<span class="description-text">TOTAL PROFIT</span>
							</div>
							<!-- /.description-block -->
						</div>
						<!-- /.col -->
						<div class="col-sm-3 col-xs-6">
							<div class="description-block">
								<span class="description-percentage text-red"><i
									class="fa fa-caret-down"></i> 18%</span>
								<h5 class="description-header">1200</h5>
								<span class="description-text">GOAL COMPLETIONS</span>
							</div>
							<!-- /.description-block -->
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.box-footer -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<!-- 数据展示以上  -->

</section>
<!-- /.content -->

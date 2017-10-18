<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Content Header (Page header) -->
<section class="content-header"><h1 style="font-weight: bolder;">快捷菜单</h1></section>

<!-- Main content -->
<section class="content">
	<!-- 快捷菜单以下 -->

	<!-- Main content -->
	<section class="content">
	
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red" style="width: 300px;margin-left:30px">
					<div class="inner">
						<h3>新增用户</h3>
						<h5>New Users</h5>
					</div>
					<div class="icon">
						<img src="resource/images/11.png" />
					</div>
					<a href="admin_addUsers.shtml" class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
					<!-- <a href="./admRegister.jsp" class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a> -->
				</div>
			</div>
			<!-- ./col -->
			
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua" style="width: 300px;margin-left:110px">
					<div class="inner">
						<H3>新增数据表</H3>

						<h5>New Data-table</h5>
					</div>
					<div class="icon">
						<img src="resource/images/33.png" />
					</div>
					<a href="./admin_cominfo.shtml" class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green" style="width: 300px;margin-left:190px">
					<div class="inner">
						<h3>新增通知</h3>

						<h5>New Notification</h5>
					</div>
					<div class="icon">
						<img src="resource/images/44.png" />
					</div>
					<a href="./admin_tongzhi2.shtml" class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- 快捷菜单以上 -->

		<!-- 通知信息以下 -->

		<!-- TABLE: LATEST ORDERS -->
		<div class="box box-info" style="width: 49%; float: left;">
			<div class="box-header with-border">
				<h3 class="box-title" style="font-weight: bolder;">通知信息</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
					<!--  <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
				</div>
			</div>
			<!--   /.box-header -->
			<div class="box-body">
				<div class="table-responsive">
					<div id=tz>
						<ul>
							<c:forEach items="${flag }" var="tz" begin="0" end="4">
							<li class=tz1><a href="./admin_gongGao.shtml?id=${tz.info.id }">${tz.info.title }【<fmt:formatDate value="${tz.info.publishDate }" pattern="yyyy-MM-dd"/>】</a>
							<c:if test="${tz.date==1 }">
							<img src="resource/images/6.png" />
							</c:if>
							</li>
							</c:forEach>

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

		<!-- 系统消息以下 -->
		<div class="box box-default"
			style="width: 49%; float: right; border-top-color: #F39C12;">
			<div class="box-header with-border">
				<h3 class="box-title" style="font-weight: bolder;">系统消息</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
					<!-- <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<div id=xt>
					<ul>
						<li class=tz><a href="#">销售到访关联任务完成【2017-08-18】</a><img
							src="resource/images/6.png" /></li>
						<li class=tz><a href="#">到访与媒体渠道关联任务失败【2017-08-18】</a><img
							src="resource/images/6.png" /></li>
						<li class=tz><a href="#">到访认筹关联任务完成【2017-08-18】</a><img
							src="resource/images/6.png" /></li>
						<li class=tz><a href="#">到访与媒体渠道关联任务完成【2017-08-17】</a></li>
						<li class=tz><a href="#">到访认筹关联任务失败【2017-08-17】</a><img
							src="resource/images/6.png" /></li>

					</ul>
				</div>
			</div>
			<div class="box-footer clearfix">
				<a href="javascript:void(0)"
					class="btn btn-sm btn-default btn-flat pull-right">more >></a>
			</div>
		</div>
		<!-- 系统消息以上 -->

		<!-- 待办事项以下  -->
		<div class="row">
			<div class="col-md-12">
				<div class="box" style="border-top-color: #DD4B39;">
					<div class="box-header with-border">
						<h3 class="box-title" style="font-weight: bolder;">待办事项</h3>

						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<div class="btn-group"></div>
						</div>

						<!-- /.box-header -->
						<!-- /.progress-group -->

						<!-- ./box-body -->

						<!-- 待办事项以下 -->
						<!-- Main content -->
						<div id="example2_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6"></div>
								<div class="col-sm-6"></div>
							</div>
							<div class="col-sm-12">
								<table id="example2"
									class="table table-bordered table-hover dataTable" role="grid"
									aria-describedby="example2_info">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1" aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending"
												style="text-align: center;">序号</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending"
												style="text-align: center;">用户帐号</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending"
												style="text-align: center;">所属企业</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending"
												style="text-align: center;">联系人姓名</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending"
												style="text-align: center;">联系人职务</th>

											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending"
												style="text-align: center;">联系人邮件</th>
											<!-- <th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending"
												style="text-align: center;">状态</th> -->
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending"
												style="text-align: center;">操作</th>
										</tr>
									</thead>
									<tbody>

									<c:forEach items="${lists }" var="comp" varStatus="status">
										<tr role="row" class="odd" style="text-align: center;">
											<td class="sorting_1">${requestScope.offset+status.index+1}</td>
											<td>${comp.phone }</td>
											<td>${comp.corpname }</td>
											<td>${comp.name }</td>
											<td>${comp.job }</td>
											<td>${comp.email }</td>
											<!-- <td><select><option>已启用</option>
													<option>已禁用</option></select></td> -->
											<td><a href="#">通过</a>&emsp;<a href="#">不通过</a></td>
										</tr>
									</c:forEach>
									</tbody>

								</table>
							</div>
						</div>
						<!-- 待办事项以上 -->
	</section>
	<!-- /.content -->

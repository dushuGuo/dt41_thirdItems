<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1 style="font-weight: bolder;">待审核用户</h1>
</section>

<!-- Main content -->
<section class="content">

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
							<table id="example1"
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
								<tbody style="text-align: center;">		
														
								</tbody>
							</table>
						</div>
					</div>
					<!-- 待办事项以上 -->
</section>

<!-- /.content -->

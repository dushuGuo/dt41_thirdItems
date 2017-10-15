<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content-header">
	<h1>
		企业数据管理 <small></small>
	</h1>
</section>


<section class="content">
	<div class="rows">
		
			<div class="box" style="border-top-color: #DD4B39;">
				
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li style="border-top-color: white;"><a
							href="admin_shuju1_1.shtml">数据表管理</a></li>
						<li style="border-top-color: white;"><a href="admin_shuju1_2.shtml"
							>数据关系管理</a></li>
						<li class="active" style="border-top-color: white;"><a href="#data3"
							data-toggle="tab">分析任务管理</a></li>
					</ul>

					<div class="tab-content">
						
						
						<div class="tab-pane active" id="data1">
						
							<div class="box-header">
								<button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal" data-target="#myModal4"
									style="width: 140px; height: 30px; font-size: 14px; line-height: 0px; margin-left: -8px; margin-top: -7px;">新增数据分析任务</button>
							</div>
							
							<table id="example4" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th style="text-align: center;">编号</th>
										<th style="text-align: center;">数据关系名称</th>
										<th style="text-align: center;">算法设定</th>
										<th style="text-align: center;">附加算法规则</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									
								</tbody>
							</table>

						</div>

						
					</div>
					
				</div>

				<!-- 模态框（Modal） -->
				<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content" style="border-radius:6px;">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h5 class="modal-title">
									选择数据关系：<select id="datarelation">
										
									</select>
								</h5>
							</div>
							<div class="modal-body">
								<form>
									<div class="form-group">
										选择算法编号: <select id="arithmetic">
											<option value="1" selected="selected">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
										</select> <br />
										<br /> 附加规则:<br />
										<br />
										<textarea id="rule" cols="auto" rows="8" required="required"
											placeholder="输入入算法规则" maxlength="200"
											style="width: 570px; height: 200px;"></textarea>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button id="saveAnalysis" type="button" class="btn btn-primary">保存</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>
				
			</div>
			
</section>

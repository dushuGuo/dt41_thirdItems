<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		企业数据管理 <small></small>
	</h1>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box" style="border-top-color: #DD4B39;">
				<!--<div class="box"> -->
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active" style="border-top-color: white;"><a
							href="#data1" data-toggle="tab">数据表管理</a></li>
						<li style="border-top-color: white;"><a
							href="admin_shuju1_2.shtml">数据关系管理</a></li>
						<li style="border-top-color: white;"><a
							href="admin_shuju1_3.shtml">分析任务管理</a></li>
					</ul>

					<div class="tab-content">
						
						<div class="tab-pane active" id="data1">
						
							<div class="box-header">
								<button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal" data-target="#myModal2"
									style="width: 120px; height: 30px; font-size: 14px; line-height: 0px; margin-left: -8px; margin-top: -7px;">新增数据表</button>
							</div>
							
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th style="text-align: center;">编号</th>
										<th style="text-align: center;">数据表名</th>
										<th style="text-align: center;">最近数据更新时间</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
								</tbody>
							</table>

							<!-- 模态框（Modal） -->
							<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h5 class="modal-title">表名：销售数据表</h5>
										</div>
										<div class="modal-body">
											<form>
												<div class="form-group">
													<table width="100%" border="1px" cellspacing="0px"
														cellpadding="0px" id="tb">
														<tr>
															<td>编号</td>
															<td>显示名称</td>
															<td>字段属性</td>
														</tr>
														<tr>
															<td>1</td>
															<td><input type="text" name="pname" value="项目名称"
																style="width: 100%"></td>
															<td>文本</td>
														</tr>
														<tr>
															<td>2</td>
															<td><input type="text" name="area" value="所在区域"
																style="width: 100%"></td>
															<td>文本</td>
														</tr>
														<tr>
															<td>3</td>
															<td><input type="text" name="date" value="日期"
																style="width: 100%"></td>
															<td>时间</td>
														</tr>
														<tr>
															<td>4</td>
															<td><input type="text" name="number" value="到访人数"
																style="width: 100%"></td>
															<td>文本</td>
														</tr>
													</table>
												</div>
											</form>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">关闭</button>
											<button type="button" class="btn btn-primary">提交更改</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal -->
							</div>

							<div class="modal fade bs-example-modal-sm" id="myModal2"
								role="dialog" aria-label="myModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-sm" style="width: 40%">
									<div class="modal-content" style="border-radius:6px;">
										<form action="" method="get">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
												<p>
												<h5 class="modal-title">
													新增的数据表名：<input class="inputs" type="text" name="shujuname">
												</h5>
												</p>
												<p>
												<h5 class="modal-title">
													数据列的默认图形展示：<input class="tus" type="radio" name="shujutu"
														checked="checked" value="0">折线图 &nbsp;&nbsp; <input
														class="tus" type="radio" name="shujutu" value="1">柱状图
												</h5>
												</p>
											</div>
											<div class="modal-body">
                                                <input type="button" value="添加行"  id="addLine"/>
												<div class="form-group">
													<table width="100%" border="1px" cellspacing="0px"
														cellpadding="0px" id="tb" class="Line">
														<tr>
														   
															<td>显示名称</td>
															<td>字段属性</td>
														
														</tr>
														<tr >
														  
															<td><input class="inputs" type="text" name="pname"
																placeholder="请输入显示的名称" style="width: 100%"></td>
															<td><select class="inputs" name="prname">
																	<option value="1" selected="selected">文本</option>
																	<option value="2">整数</option>
																	<option value="3">浮点数</option>
															</select></td>
															
														</tr>
						
													</table>
												</div>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
												<button id="baocun" type="button" class="btn btn-primary">
													保存</button>
											</div>
										</form>
										
										<script type="text/javascript">
										
										
             $("#baocun").click(function(){
            	 var values=[];
            	 var tu =document.getElementsByName("shujutu");
            	 var tuid;
            	 for(var i = 0; i < 2; i++)
            	 {
            	      if(tu[i].checked)
            	      {
            	      tuid=i;
            	      }
            	  }
            	 values.push(tuid)
            	 $(".inputs").each(function(i){
            		 values.push($(this).val());
            	 })
            	 $.ajax({
               		url:"./admin_create.shtml",
               		type:"post",
               		traditional:true,
               		data:{
  						"values":values             			
               		},
               		dataType:"json",
               		success:function(result){
               		if(result.flag==1){
               			window.location.href="./admin_shuju1_1.shtml"
               		}
               		}
   					
               }) 
              /*  $("#myModal2").hide();       		
            	$(".modal-backdrop").hide(); */
            	})
            	
            	$("#addLine").click(function(){
											$(".Line").append(
													'<tr>'+
													'<td><input class="inputs" type="text" name="pname"'+
													'placeholder="请输入显示的名称" style="width: 100%"></td>'+
												    '<td><select class="inputs" name="prname">'+
												    '<option value="1" selected="selected">文本</option>'+
													'<option value="2">整数</option>'+
													'<option value="3">浮点数</option>'+
												    '</select></td>'+
													'</tr>'
											);
										});
            </script>
           
            
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>
</section>


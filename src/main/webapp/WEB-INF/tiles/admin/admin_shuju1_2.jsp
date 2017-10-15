<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- Content Header (Page header) -->
    <section class="content-header">
    <!-- 修改过页面 -->
      <h1>
        企业数据管理
        <small></small>
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
              <li style="border-top-color: white;"><a href="admin_shuju1_1.shtml">数据表管理</a></li>
              <li class="active" style="border-top-color: white;"><a href="#data2" data-toggle="tab">数据关系管理</a></li>
              <li style="border-top-color: white;"><a href="admin_shuju1_3.shtml">分析任务管理</a></li>
            </ul>

            <div class="tab-content">

              <!-- data2-->
              <div class="tab-pane active" id="data1">
				
              <div class="box-header"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal3" style="width: 120px;height: 30px;font-size: 14px;line-height: 0px;margin-left: -8px;margin-top: -7px;">新增数据关系</button></div>   
                  <table id="example3" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="text-align: center;">编号</th>
                  <th style="text-align: center;">数据关系名称</th>
                  <th style="text-align: center;">关联表名</th>
                  <th style="text-align: center;">统一维度列</th>
                  <th style="text-align: center;">操作</th>
                </tr>
                </thead>
                <tbody style="text-align: center;" id="datarelation">
                <c:forEach items="${datarelationList}" var="datarelation" varStatus="status">
                   <tr>
	                  <td>${requestScope.offset+status.index+1}</td>
	                  <td>${datarelation.name }</td>
	                  <td>${datarelation.tid1name }、${datarelation.tid2name}</td>
	                  <td>${datarelation.tid1name}-${datarelation.col1name}、${datarelation.tid2name}-${datarelation.col2name}</td>
	                  <td><select class="state">
	                  <c:if test="${datarelation.state==1 }">
	                  	<option value="1" selected="selected">已启用</option>
	                  	<option value="0">已禁用</option>
	                  </c:if>
	                   <c:if test="${datarelation.state==0 }">
	                  	<option value="1">已启用</option>
	                  	<option value="0" selected="selected">已禁用</option>
	                  </c:if>
	                  </select>
	                  		<input type="hidden" value= ${datarelation.id } />
	                  </td>
                  </tr>
                </c:forEach>
               
                <!-- <tr>
                 <td>2</td>
                  <td>销售认筹关联</td>
                  <td>销售数据表、到访数据表</td>
                  <td>销售数据表.日期、到访数据表.日期</td>
                  <td><select><option>已启用</option><option>已禁用</option></select></td>
                </tr>
                 <tr>
                  <td>3</td>
                  <td>派单到访关联</td>
                  <td>销售数据表、到访数据表</td>
                  <td>销售数据表.日期、到访数据表.日期</td>
                  <td><select><option>已启用</option><option>已禁用</option></select></td>
                </tr>                -->
                </tbody>
              </table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius:6px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h5 class="modal-title">关联关系表名：<input type="text" name="name" id="name"></h5>
            </div>
            <div class="modal-body">
                 
                    <div class="form-group">  
                        数据表A: <select name="tid1" id="tid1">
                              </select>&emsp;&emsp;&emsp;&emsp;&emsp;
                        统一的维度列: <select name="col1" id="col1">
                           </select>
                              <br/><br/>
                        数据表B: <select name="tid2" id="tid2">
                              </select>&emsp;&emsp;&emsp;&emsp;&emsp;
                        统一的维度列: <select name="col2" id="col2">
                              </select>
                    </div>  
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="submit">
                    保存
                </button>
            </div>
        </div>
    </div>
</div>  

            </div>
          
          </div>
         
        </div>

  
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       通知中心
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <!-- /.box -->
          <div class="box">
          
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="text-align: center;">编号</th>
                  <th style="text-align: center;">标题</th>
                   <th style="text-align: center;">发布时间</th>
                </tr>
                </thead>
                <tbody id="check_1">
                <c:forEach items="${infoList }" var="list" varStatus="status">
                     <tr>
		                  <th style="text-align: center;">${requestScope.offset+status.index+1}</th>
		                  <th style="text-align: center;"><a href="./gongGao.shtml?id=${list.id }" style="color:black">${list.title }</a></th>
		                  <th style="text-align: center;">
		                  <fmt:formatDate value="${list.publishDate }" pattern="yyyy-MM-dd" />
		                  </th>
		             </tr>
                   </c:forEach>             
                </tbody>
                
              </table>
            </div>


            <!-- /.box-body -->
            
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

  
  <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="height:60%">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               信息显示
            </h4>
         </div>
         
         <div class="modal-body">
         <center>
            <table border="1px solid black" width="300px" height="100px">
              <tr><td>编号</td><td>推理</td><td>结论</td></tr>
              <tr>
                <td>12</td>
                <td>11</td>
                <td>11</td>
              </tr>
              <tr>
                <td>11</td>
                <td>11</td>
                <td>11</td>
              </tr>
            </table>
         </center>   
         <p>
         任务反馈中存放的是反馈结果id，通过调用一个接口，以反馈结果id为参数，获得一个二维的String数组（例如{["编号","推理规则"，"结论"],["1","(A>6,B&lt;3)","C>=12"],["2","(C>6,F&lt;1)","E<=42"]}），第一行是表头，后续每行都是结果值。点击"下载计算结果"，则当前表格被输出到CSV文件中，弹出文件保存对话框。
        </p>


         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-default"
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary">
               下载计算结果
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<style>
.dataTable{
text-align: center;
}
</style>

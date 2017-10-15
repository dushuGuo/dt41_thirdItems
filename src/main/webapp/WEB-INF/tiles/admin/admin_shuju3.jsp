<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
         数据分析任务情况
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box" style="border-top-color: #DD4B39;">
            <div class="box-header">
              <h3 class="box-title" >${message2.datarelation.name }&nbsp;&nbsp;&nbsp;&nbsp;算法ID：${message2.arithmeticid }</h3> 
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="text-align: center;">编号</th>
                  <th style="text-align: center;">任务开始时间</th>
                  <th style="text-align: center;">任务结束时间</th>
                  <th style="text-align: center;">任务状态</th>
                  <th style="text-align: center;">任务反馈</th>                
                </tr>
                </thead>
                <tbody style="text-align: center;">
                <c:forEach items="${result }" var="res" varStatus="status">
                	<tr>
	                  	<td>${requestScope.offset+status.index+1}</td>
	                  	<td><fmt:formatDate value="${res.starttime }" pattern="yyyy-MM-dd HH-mm-ss"/></td>
	                  	<td><fmt:formatDate value="${res.endtime }" pattern="yyyy-MM-dd HH-mm-ss"/></td>
	                  	<td>
	                  		<c:if test="${res.state==0 }">已添加</c:if>
	                  		<c:if test="${res.state==1 }">进行中</c:if>
	                  		<c:if test="${res.state==2 }">已完成</c:if>
	                  	</td>
	                  	<td>
	                  	    <c:if test="${res.state==2 && res.taskstatus==0 }">
	                  	        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2" data-whatever="@jason" style="width: 110px;height: 20px;font-size: 13px;line-height: 0px">查看结果</button>
	                  	    </c:if>
	                  	    <c:if test="${res.state==2 && res.taskstatus==1 }">
	                  	        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1" data-whatever="@jason" style="width: 110px;height: 20px;font-size: 13px;line-height: 0px">查看结果</button>
	                  	    </c:if>
	                  	    <c:if test="${res.state!=2 }">
	                  	        <button type="button" class="btn btn-inverse btn-lg" data-toggle="modal" data-target="#myModal0" data-whatever="@jason" style="width: 110px;height: 20px;font-size: 13px;line-height: 0px">查看结果</button>
	                  	    </c:if>
	                  	
	                  	</td>
                	</tr>
                
                </c:forEach>
                
                
                </tbody>
              </table>
              
<div class="modal fade bs-example-modal-sm" id="myModal0" role="dialog" aria-label="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog modal-sm" style="width: 40%">  
        <div class="modal-content" style="border-radius:6px;">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
                    <span aria-hidden="true">×</span>  
                </button>  
                <h4 class="modal-title">任务执行中......</h4>  
            </div>  
            </div> 
        </div>  
    </div>  
</div>             
              
<div class="modal fade bs-example-modal-sm" id="myModal1" role="dialog" aria-label="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog modal-sm" style="width: 40%">  
        <div class="modal-content" style="border-radius:6px;">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
                    <span aria-hidden="true">×</span>  
                </button>  
                <h4 class="modal-title">任务执行出错</h4>  
            </div>  
            <div class="modal-body">  
                <form>  
                    <div class="form-group">  
                        <label class="control-label">出错原因为：</label>  
                        abcdefafdasfasdfaasdfasdfasdfasdfasdfasdfasdfewrqerqwfdsafdassfdasd当任务失败时，任务反馈的字段中存放的不是任务反馈id，而是任务的出错信息。可在点选出错信息后，直接展示。fasdfasdfasfdsafasewqrqwreafdasfdfdasfdasdfasdfasdfasdf  
                    </div>      
                </form>  
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">  
                    关闭  
                </button>  
                <!-- <button type="button" class="btn btn-primary">  
                    保存  
                </button>   -->
                </div>
            </div> 
        </div>  
    </div>  
</div> 
 

<div class="modal fade bs-example-modal-sm" id="myModal2" role="dialog" aria-label="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog modal-sm" style="width: 40%">  
        <div class="modal-content" style="border-radius:6px;">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
                    <span aria-hidden="true">×</span>  
                </button>  
                <h4 class="modal-title">信息如下</h4>  
            </div>  
            <div class="modal-body">  
                <form>  
                    <div class="form-group">  
                        <table width="100%" border="1px" cellspacing="0px" cellpadding="0px" id="tb">
                          <tr>
                            <td>编号</td>
                            <td>推理规则</td>
                            <td>结论</td>
                          </tr>
                          <tr>
                            <td>1</td>
                            <td>(A>6,B<3)</td>
                            <td>C>=12</td>
                          </tr>                          
                          <tr>
                            <td>2</td>
                            <td>(C>6,F<1)</td>
                            <td>E<=42</td>
                          </tr>
                        </table> 
                    </div>  
                    <div class="form-group">  
                        <label class="control-label">备注：</label>  
                        任务反馈中存放的是反馈结果id，通过调用一个借口，以反馈结果id为参数，获得一个二维的String数组（例如{["编号","推理规则"，"结论"],["1","(A > 6,B < 3)","C>=12"],["2","(C >6,F < 1)","E<=42"]}），第一行是表头，后续每行都是结果值。点击"下载计算结果"，则当前表格被输出到CSV文件中，弹出文件保存对话框。
                    <hr><button type="button" style="width: 100px;height: 20px;font-size: 10px;line-height: 0px">下载计算结果</button>                    
                </form>  
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">  
                    关闭  
                </button>  
                <!-- <button type="button" class="btn btn-primary">  
                    保存  
                </button>   -->
                </div>
            </div> 
        </div>  
    </div>  
</div>  
<!--end modal2-->  
          
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
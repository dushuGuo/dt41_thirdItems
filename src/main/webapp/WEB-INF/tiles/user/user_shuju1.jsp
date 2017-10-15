<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        分析任务列表
        <!-- <small>advanced tables</small> -->
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          
          <!-- /.box -->
          <select id="Analysistasks">
          
          </select>

          <div class="box">
          <div id="getDataTable" style="background:#ECF0F5;font-family: Microsoft Yahei;font-size: 15px">关联的数据表：销售数据表、到访数据表        统一的维度属性：销售数据表.销售日期、到访数据表.到访日期</div>
          
            <div class="box-header" style="width: 180px">
              <h3 class="box-title">数据分析任务列表</h3>
            </div>
            <div style="margin-left: 180px;margin-top: -35px"><button id="start" type="button" class="btn btn-primary btn-lg" data-target="#myModal2" data-whatever="@jason" style="width: 100px;height: 30px;font-size: 14px;line-height: 0px">启动新任务</button></div>
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="text-align: center;">编号</th>
                  <th style="text-align: center;">任务开始时间</th>
                  <th style="text-align: center;">任务结束时间(s)</th>
                  <th style="text-align: center;">任务状态</th>
                  <th style="text-align: center;width:200px" style="text-align: center;">任务反馈</th>
                </tr>
                </thead>
                <tbody id="check_1" style="text-align: center;">
         			
         			
         			
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

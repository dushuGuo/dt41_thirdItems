<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        消息管理
        <small>消息编辑器</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    <form action="./tongzhi_insert.shtml" method="post">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title" style="font-weight: bold;font-size: 20px">
                <small><b></b></small>	
              </h3>                           
              <div style="text-align: left;"><span style=" font-size: 18px;font-family:  ">公告标题：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="最多十个字标题" maxlength="10" type="text" name="title" style="width: 100%;height: 30px" required="required"></div>
              <br>
              <div style="text-align: left;" ><span style="font-size: 18px;font-family:  ">公告作者：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="publisher" style="width: 100%;height: 30px" required="required"></div>

              <div class="pull-right box-tools">
                
                <button type="button" class="btn btn-info btn-sm"  data-toggle="tooltip"
                        title="clear" style="margin-top: 12px; font-size: 14px">清空</button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body pad">
                    <textarea id="editor1" name="details" rows="10" cols="80" required="required">                        
                   
                    </textarea>             
              <br>
              <button id="ok" type="submit" class="btn btn-primary btn-lg" onclick="return dd();" data-toggle="modal" data-target="#myModalaaaaaaaaaa" data-whatever="@jason" style="width: 70px;height: 30px;font-size: 14px;line-height: 0px">确定</button>
               <button onclick="javascript:history.back(-1)" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2aaaaaaaaa" data-whatever="@jason" style="width: 70px;height: 30px;font-size: 14px;line-height: 0px;float: right">返回</button>
            </div>              
          </div>          
          <!-- /.box -->
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
      </form>
    </section>
<script language="jscript"> 
	function dd() { if(confirm("请确认是否完成提交?" )) return true; return false;  }
</script>     
 
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
         
           <span style="font-size: 20px;padding-left: 100px;font-family: 'Microsoft YaHei'">是否清空所有内容</span>
            
    


         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-default"
               data-dismiss="modal">关闭
            </button>
            <button id="oks" type="button" class="btn btn-primary" data-dismiss="modal">
               确定
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="height:60%">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel2">
               信息显示
            </h4>
         </div>
         
         <div class="modal-body">
         
           <span style="font-size: 20px;padding-left: 100px;font-family: 'Microsoft YaHei'">您的邮件还未保存上传，跳转后将会清空所有内容，是否确定跳转</span>
            
    


         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-default"
               data-dismiss="modal">关闭
            </button>
            <button id="oks2" type="button" class="btn btn-primary" data-dismiss="modal">
               确定
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


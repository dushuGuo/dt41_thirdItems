<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<script src="build/js/ajaxfileupload.js" type="text/javascript"></script>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        数据列表
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
                  <th>编号</th>
                  <th>数据表名</th>
                  <th>最近数据更新时间(s)</th>
                  <th style="text-align: center;width:200px">操作</th>
                  
                </tr>
                </thead>
                <tbody>
             
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
    

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true" >
   <div class="modal-dialog" style="height:60%">
      <div class="modal-content" style="border-radius:6px;">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               信息显示
            </h4>
         </div>
         
          <form  enctype="multipart/form-data" method="post" action="./user_uploads.shtml">
         <div class="modal-body">
         <center>
            <input class="ups1" type="text" size="20" name="upfile" id="upfile" style="border:1px dotted #ccc">  

            <input class="ups3"  type="button" value="浏览" onclick="path.click()" style="border:1px solid #ccc;background:#fff">  
            <input class="ups2" type="file" id="path" name="path" style="display:none" onchange="upfile.value=this.value">
            <input type="hidden" name="hidden" />
         </center>   
         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-default"
               data-dismiss="modal">关闭
            </button>
            <button id="ok_10" type="submit" class="btn btn-primary">
               确定
            </button>
         </div>
            </form>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
	$("#ok_10").click(function(){
		
		 $("#myModal").hide();       		
    	$(".modal-backdrop").hide(); 
	})
</script>

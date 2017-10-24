<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
tr td:last-child{
display:none;
}
.tableLine th:last-child{
display:none;
} 
.dataTable{
text-align: center;
}
th{
text-align: center;
}

</style>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	数据详情
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i>最近一次的更新时间</li>
        <li>2017-04-22</li>
        <li>15:20:33</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <!-- /.box -->
          <div class="box">
            <div class="box-header" style="width: 180px">
              <h3 class="box-title">数据分析任务列表</h3>
            </div>
            <div id="uploads" style="margin-left: 180px;margin-top: -35px"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2" data-whatever="@jason" style="width: 100px;height: 30px;font-size: 14px;line-height: 0px">上传新数据</button></div>

            <div style="margin-left: 300px;margin-top: -29.7px"><button id="write" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2" data-whatever="@jason" style="width: 100px;height: 30px;font-size: 14px;line-height: 0px">导出数据</button></div>
            <div class="box-body">
              <!-- 更新 -->
            <table id = "example1" class="table table-bordered table-striped">
                <thead>
                <tr class = "tableLine">
         
                  <%-- <th>${TablecolumninfoList[3].columnname }</th> --%>
                  
                   <c:forEach items="${TablecolumninfoList}" var="info" varStatus="status">
         
                  <th>${info.columnname}</th>
             
                  </c:forEach> 
                  
                 <!--  <th>日期</th>
                  <th class="people_num">到访人数</th>
                  <th class="people_num">认筹人数</th>
                  <th>退订人数</th> -->
                   
                   
                </tr>
                </thead>
                <tbody>
                
                </tbody>
                
              </table>
  <!-- Main content -->
    
        <div class="col-md-6">
          <!-- AREA CHART -->
          <div id="areaTu" class="box box-primary" style="width:700px;position: fixed;top:38%;left:-100%">
            <div class="box-header with-border">
              <h3 class="box-title">曲线关系图</h3>

              <div class="box-tools pull-right">
                
                <button id="area-close" type="button" class="btn btn-box-tool" ><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="areaChart" style="height:250px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- BAR CHART -->
          <div id="barTu" class="box box-success" style="width:700px;position: fixed;top:38%;left:-100%">
            <div class="box-header with-border">
              <h3 class="box-title">柱状关系图</h3>

              <div class="box-tools pull-right">
                
                <button id="bar-close" type="button" class="btn btn-box-tool" ><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="barChart" style="height:230px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
    <!-- /.content -->   
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
   aria-labelledby="myModalLabel" aria-hidden="true">
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

            <input type="button" value="浏览" onclick="file.click()" style="border:1px solid #ccc;background:#fff">  
            <input class="ups2" type="file" id="file" name="file" style="display:none" onchange="upfile.value=this.value">
             <!-- <input type="file" id="path" style="display:none" onchange="upfile.value=this.value"> -->
             <p>*只能上传excel文件,文件大小需要小于2M,文件名需与表名一致!</p>
         </center>   
         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-default"
               data-dismiss="modal">关闭
            </button>
            <button id="ok_11" type="submit" class="btn btn-primary">
               确定
            </button>
            <input type="hidden" name="hidden" />
         </div>
         </form>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal_1" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" style="height:60%">
      <div class="modal-content" style="border-radius:6px;">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel_1">
               信息显示
            </h4>
         </div>
         
         <div class="modal-body">
         <center>
            <textarea id="text-area" cols="70" rows="10" ></textarea>
         </center>   
    


         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-default"
               data-dismiss="modal">关闭
            </button>
            <button  type="button" class="btn btn-primary">
               确定
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var urlinfo=window.location.href//获取当前地址
var offset=urlinfo.indexOf("&infoId");//设置参数字符串开始的位置
var tableName=urlinfo.substring((offset+7));//取出参数字符串 这里会获得类似“id=1”这样的字符串
var infoId = UrlDecode(tableName);
$.post("/admin_shujus.shtml",{"infoId":infoId});


$("input[name=hidden]").attr("value",destr);

	$("#ok_11").click(function(){
		var a1=$(".ups1").val();
		$.ajax({
			url:"./user_uploadss.shtml",
       		type:"post",
       		traditional:true,
       		data:{
					"urls":a1             			
       		},
       		dataType:"json",
       		success:function(result){
       			if(result.flag==1){
       				window.location.href="./user_shuju3.shtml?id=${name2}"
       			}
       		}
       			
       		 
		})
		 
	});
	
	function UrlDecode(zipStr){ 
	    var uzipStr=""; 
	    for(var i=0;i<zipStr.length;i++){ 
	        var chr = zipStr.charAt(i); 
	        if(chr == "+"){ 
	            uzipStr+=" "; 
	        }else if(chr=="%"){ 
	            var asc = zipStr.substring(i+1,i+3); 
	            if(parseInt("0x"+asc)>0x7f){ 
	                uzipStr+=decodeURI("%"+asc.toString()+zipStr.substring(i+3,i+9).toString()); 
	                i+=8; 
	            }else{ 
	                uzipStr+=AsciiToString(parseInt("0x"+asc)); 
	                i+=2; 
	            } 
	        }else{ 
	            uzipStr+= chr; 
	        } 
	    } 
	 
	    return uzipStr; 
	} 
	 
	function StringToAscii(str){ 
	    return str.charCodeAt(0).toString(16); 
	} 
	function AsciiToString(asccode){ 
	    return String.fromCharCode(asccode); 
	}
</script>




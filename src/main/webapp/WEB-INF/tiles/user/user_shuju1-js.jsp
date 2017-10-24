<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
  $(function () {
	  $.post("shuju_0.shtml",function(data){
		  $.each(data,function(){
			  var str = '<option value="'+this.id+'">'+this.datarelation.name+'  ---  算法ID：'+this.arithmeticid+'</option>';
			  $("#Analysistasks").append(str);
		  });
		  var id = $("#Analysistasks").val();
		  show(id);
		  show2(id);
	  });
	  
	  $("#Analysistasks").change(function(){
		  var ids = $("#Analysistasks").val();
		  show(ids);
		  show2(ids);
	  });
	  
	$("#start").click(function(){
		var flag = confirm("确认启动新任务？");
		if(flag == true){
			var idss = $("#Analysistasks").val();
			$.post("startResult.shtml",{"aid":idss},function(data){
				
				show(idss);
			})
		}
	});
	
  })
  
  function show(id){
	  $.post("shuju_1.shtml",{"aid":id},function(data){
		  $("#check_1").children().remove();
		  $.each(data,function(eve){
			 var str = '<tr><th style="text-align: center;">'+(eve+1)+'</th>'
                 +'<th style="text-align: center;">'+(this.starttime==null?"":new Date(this.starttime).getFullYear()+"-"+((new Date(this.starttime).getMonth()+1)<10?('0'+(new Date(this.starttime).getMonth()+1)):(new Date(this.starttime).getMonth()+1))+"-"+(new Date(this.starttime).getDate()<10?('0'+new Date(this.starttime).getDate()):new Date(this.starttime).getDate())+" "+(new Date(this.starttime).getHours()<10?('0'+new Date(this.starttime).getHours()):new Date(this.starttime).getHours())+":"+(new Date(this.starttime).getMinutes()<10?('0'+new Date(this.starttime).getMinutes()):new Date(this.starttime).getMinutes())+":"+(new Date(this.starttime).getSeconds()<10?('0'+new Date(this.starttime).getSeconds()):new Date(this.starttime).getSeconds()))+'</th>'
                 +'<th style="text-align: center;">'+(this.endtime==null?"":new Date(this.endtime).getFullYear()+"-"+((new Date(this.endtime).getMonth()+1)<10?('0'+(new Date(this.endtime).getMonth()+1)):(new Date(this.endtime).getMonth()+1))+"-"+(new Date(this.endtime).getDate()<10?('0'+new Date(this.endtime).getDate()):new Date(this.endtime).getDate())+" "+(new Date(this.endtime).getHours()<10?('0'+new Date(this.endtime).getHours()):new Date(this.endtime).getHours())+":"+(new Date(this.endtime).getMinutes()<10?('0'+new Date(this.endtime).getMinutes()):new Date(this.endtime).getMinutes())+":"+(new Date(this.endtime).getSeconds()<10?('0'+new Date(this.endtime).getSeconds()):new Date(this.endtime).getSeconds()))+'</th>'
                 +'<th style="text-align: center;">'+(this.state==0?"已添加":(this.state==1?"进行中":"已完成"))+'</th>'
                 +'<th style="text-align: center;width:200px" style="text-align: center;"><button type="button" class="btn '+(this.state==2?"btn-primary":"btn-inverse")+' btn-lg results" data-toggle="modal" '+(this.state==2?(this.taskstatus==0?'data-target="#myModal2"':'data-target="#myModal1"'):'data-target="#myModal0"')+'data-target="#myModal2" data-whatever="@jason" style="width: 110px;height: 20px;font-size: 13px;line-height: 0px">查看结果</button></th></tr>';
		 $("#check_1").append(str);
		 })
	  });
  }
  
  function show2(id){
	  $.post("getDataTable.shtml",{"aid":id},function(data){
		  var str = "关联的数据表："+data.tid1name+"、"+data.tid2name+"        统一的维度属性："+data.tid1name+"."+data.col1name+"、"+data.tid2name+"."+data.col1name;
		  $("#getDataTable").text(str);
	  });
  }
  
  
</script>

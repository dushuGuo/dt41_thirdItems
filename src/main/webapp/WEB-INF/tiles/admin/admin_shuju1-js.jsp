<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script>
  $(function () {
	var t =	$('#example1').DataTable({
		 "ajax"		: {
	    	  "url"		: "<%=request.getContextPath()%>/shujus_2.shtml",
	    	  "method"	: "POST",
	    	  "headers" : {"Content-Type": "application/json"},
	    	  "data"	: function(d){
	    		  return JSON.stringify(d);
	    	  }
	      },
	      "columns": [
	    	  {"data": "office",
	    	 "defaultContent": "1"},
	    	  {"data":"name"},
	    	  {"data":"updatetime"}, 
	      ],
	      
	      
	      "columnDefs": [
		 					{
		 	    		   "targets": 3,
		 	    		   "render":function(data, type, row, meta) { return '<a href="./admin_shujus.shtml?id='+row.name+'&infoId='+row.cid+'" style="color:white"><button class="btn btn-primary btn-lg" data-toggle="modal" style="width: 110px;height: 20px;font-size: 13px;line-height: 0px">查看数据</button></a>&emsp;<select id="ableOrDisable" onchange="changeon('+row.id+',this.value)" ><option value="1">已启用</option><option value="0">已禁用</option></select>'; } 
		 					}
		 					]
	      
	});
		t.on('order.dt search.dt',
		 function() {
   		       t.column(0, {
   		              search: 'applied',
   		              order: 'applied',
   		        }).nodes().each(function(cell, i) {
   		              cell.innerHTML = i + 1;
   		  	  
   		  	   })        	 	
   		  	   }).draw();	

  });
	
</script>
<!-- 个人修改 -->
 <script type="text/javascript">
 function changeon(id,option){
	 $.ajax({
		 url:'<%=request.getContextPath()%>/shujus_updatebyid.shtml',
		 type:'post',
		 data:{
			 "id":id,
			 "option":option
		 },
		 dataType:'json',
		 success:function(result){
			 if(option==1){
				 confirm("确认启用吗？")
			 }else{
				 confirm("确认禁用吗？")
			 }
		 }
		 
	 });
 };
 
	
</script>
	


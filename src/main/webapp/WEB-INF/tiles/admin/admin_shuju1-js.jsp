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
		 	    		   "render":function(data, type, row, meta) { return '<a href="./admin_shujus.shtml?id='+row.name+'&infoId='+row.id+'" style="color:white"><button class="btn btn-primary btn-lg" data-toggle="modal" style="width: 110px;height: 20px;font-size: 13px;line-height: 0px">查看数据</button></a>&emsp;<select><option>已启用</option><option>已禁用</option></select></td>'; } 
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

	
  })
</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script>

   $(function () {
	  
	   $.post("getDatarelation.shtml",function(data){
		   $.each(data,function(){
			   if(this.state==1){
				   var str = '<option value="'+this.id+'">'+this.name+'</option>';
				   $("#datarelation").append(str);
			   }
		   });
	   });
	  
	   
	   $("#saveAnalysis").click(function(){
		   var datarelation = $("#datarelation").val();
		   var arithmetic = $("#arithmetic").val();
		   var rule = $("#rule").val();
		   $.post("saveAnalysis.shtml",{"did":datarelation,"arithmeticid":arithmetic,"rule":rule},function(data){
			   if(data == "0"){
				   alert("分析任务添加重复");
			   }else{
				   alert("分析任务添加成功");
				   location = "admin_shuju1_3.shtml";
			   }
		   });
	   });
	  
	  
	var t =	$('#example4').DataTable({
		 "ajax"		: {
	    	  "url"		: "<%=request.getContextPath()%>/shujus_3.shtml",
	    	  "method"	: "POST",
	    	  "headers" : {"Content-Type": "application/json"},
	    	  "data"	: function(d){
	    		  return JSON.stringify(d);
	    	  }
	      },
	      "columns": [
	    	  {"data": "office",
	    	 "defaultContent": "1"},
	    	  {"data":"datarelation.name"},
	    	  {"data":"arithmeticid"}, 
	    	  {"data":"rule"},
	      ],
	      "columnDefs": [
		 					{
		 	    		   "targets": 4,
		 	    		   "render":function(data, type, row, meta) { return '<a href="./admin_shuju3.shtml?id='+row.id+'" style="color: white"><button class="btn btn-primary btn-lg" data-toggle="modal" style="width: 110px; height: 20px; font-size: 13px; line-height: 0px">查看任务情况</button></a>'; } 
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

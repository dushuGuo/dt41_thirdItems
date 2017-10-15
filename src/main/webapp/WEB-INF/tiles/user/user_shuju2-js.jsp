<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<script type="text/javascript">

 function pop1(tableName){
             
	        $("input[name=hidden]").attr("value",tableName);
		    $(".uploads").attr("data-toggle","modal");
		    $(".uploads").attr("data-target","#myModal")
		    $(".uploads").attr("id","identifier");
		    $('#myModal').modal({
		      show:false,
		      backdrop:"static",
		      keyboard:false

		    }); 
 }    
 function pop2(){
     
	   
}    

    
</script>
<script type="text/javascript">
$(".close").click(function(){
      $("#upfile").val("");

});
$("button[data-dismiss=modal]").click(function(){
      $("#upfile").val("");

});
$("#ok_10").click(function(){
	$("#ups1").val("")
})
</script>
<script>
  $(function () {
	var t =	$('#example1').DataTable({
		 "ajax"		: {
	    	  "url"		: "<%=request.getContextPath()%>/shuju_2.shtml",
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
	 	    		   "render":function(data, type, row, meta) { return '<button type="button" class="btn btn-primary btn-lg uploads" data-toggle="modal" data-target="#myModal2" data-whatever="@jason" style="width: 80px;height: 20px;font-size: 10px;line-height: 0px" onclick="pop1(\''+row.name+'\')">上传数据</button>&emsp;&emsp;&emsp;&emsp;&emsp;<a href="./user_shuju3.shtml?id='+row.name+'&infoId='+row.id+'"><button type="button" class="btn btn-primary btn-lg searches" data-toggle="modal" data-target="#myModal2" data-whatever="@jason" style="width: 80px;height: 20px;font-size: 10px;line-height: 0px" onclick="pop2()">查看数据</button></a>'; } 
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
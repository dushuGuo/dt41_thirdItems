<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page script -->
<script>
  $(function () {
	var t =	$('#example1').DataTable({
		 "ajax"		: {
	    	  "url"		: "<%=request.getContextPath()%>/dt_list2.shtml",
	    	  "method"	: "POST",
	    	  "headers" : {"Content-Type": "application/json"},
	    	  "data"	: function(d){
	    		  return JSON.stringify(d);
	    	  }
	      },
	      "columns": [
	    	  {"data": "office","defaultContent": "1"},
	    	  {"data":"email"},
	    	  {"data":"name"},
	    	  {"data":"job"},
	    	  {"data":"phone"},	    	  
	    	  ],
	      "columnDefs": [
			  {
			    "targets": 5,
			    "render": function ( data, type, row, meta ) {
			    /* 将当前值传入controller */	    		    	
			     return '<a href="./admin_delete.shtml?id='+row.id+'" onclick="return dd();"  class="button button-primary button-rounded button-small" style="font-size: 14px;">删除</a>';	 			    			
			    }
			  }
			],	      
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
<script language="jscript"> 
	function dd() { if(confirm("请确认是否删除！" )) return true; return false;  }
</script> 
<!-- <script type="text/javascript">
   	function pop(){
   	  $(".delete_btn").attr("data-toggle","modal");
      $(".delete_btn").attr("data-target","#myModal")
      $(".delete_btn").attr("id","identifier");
      $('#myModal').modal({
        show:false,
        backdrop:"static",
        keyboard:false
   	})
   	}
    
</script> -->




<%-- <script>
  $(function () {
    $('#example1').DataTable({
        "ajax"		: {
      	  "url"		: "<%=request.getContextPath()%>/dt_list2.shtml",
      	  "method"	: "POST",
      	  "headers" : {"Content-Type": "application/json"},
      	  "data"	: function(d){
      		  return JSON.stringify(d);
      	  }
        },
        "columns": [
      	  {"data":"id"},
      	  {"data":"name"},
      	  {"data":"email"},
      	  {"data":"phone"},
      	  {"data":"job"},
      	  {"data":"删除"}
        ]
    })
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script> --%>
 
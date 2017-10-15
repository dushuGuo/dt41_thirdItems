<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
	
  $(function () {
   var t = $('#example1').DataTable({
		 "ajax"		: {
	    	  "url"		: "<%=request.getContextPath()%>/dt_lists4.shtml",
	    	  "method"	: "POST",
	    	  "headers" : {"Content-Type": "application/json"},
	    	  "data"	: function(d){
	    		  return JSON.stringify(d);
	    	  }
	      },
	      "columns" :[
	    	  {"data": "office","defaultContent": "1"},
	    	  {"data":"compname"}
	                  ],
	      "columnDefs": [	                     
					{
	    		    "targets": 2,
	    		    "render": function ( data, type, row, meta ) {
	    		     return '<a href="./admin_shuju1_1.shtml?id='+row.id+'" class="button button-primary button-rounded button-small" style="font-size: 14px;">查看</a>';   		    		
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
          
              $("#check_1 tr").find("td:eq(0)").css("width","100px")
              $("#check_1 tr").find("td:eq(0)").css("text-align","center")
              
              $("#check_1 tr").find("td:eq(1)").css("width","500px")
            
              $("#check_1 tr").find("td:eq(2)").css("text-align","center")     
              $("#check_1 tr").find("td:eq(2)").mouseenter(function(){
                $(this).css("cursor","pointer");
              });
            
              $("#check_1 tr").find("td:eq(1)").mouseenter(function(){
                $(this).css("cursor","pointer");
              });
              $("#check_1 tr").find("td:eq(1)").click(function(){
              	window.location.href="./#"
              })
            </script>
            
           <!-- <script type="text/javascript">
          		function pop1(data, type, row){
          			console.log(row);
          			var title=$("title").val();
          			var a =$("publisher").val();
          			window.location.href="./admin_tongzhi3.shtml?title="+title+"&publisher="+publisher;
          		}
           </script> -->
           
<script type="text/javascript">
   
    $("#check_1 tr").find("td:eq(4)").click(function(){    
    $("#check_1 tr").find("td:eq(4)").attr("data-toggle","modal");
    $("#check_1 tr").find("td:eq(4)").attr("data-target","#myModal")
    $("#check_1 tr").find("td:eq(4)").attr("id","identifier");
    $('#myModal').modal({
      show:false,
      backdrop:"static",
      keyboard:false
   	 }    
    ); 
     });
  
</script>
<script>



  $(function () {
	  /* function myEditor(){
		  console.log(111);
	  } */
	var t =	$('#example1').DataTable({
		 "ajax"		: {
	    	  "url"		: "<%=request.getContextPath()%>/dt_lists3.shtml",
	    	  "method"	: "POST",
	    	  "headers" : {"Content-Type": "application/json"},
	    	  "data"	: function(d){
	    		  return JSON.stringify(d);
	    	  }
	      },
	      "columns" :[
	    	  {"data": "office","defaultContent": "1"},
	                  
	                  ],
	      "columnDefs": [
	                     {
	                      "targets": 1,
	                      "data":"title",
	                      "render": function ( data, type, row, meta ) {
	      	    		    /* 将当前值传入controller */	  
	      	    		    /*  <button class="button button-3d button-action button-circle button-jumbo"  ><i class="fa fa-thumbs-up">编辑</i></button> */
	      	    		     return '<a href="./admin_gongGao.shtml?id='+row.id+'" style="color:black">'+data+'</a>';}
	                     },
					{
	    		    "targets": 2,
	    		    /* "data": "title", */
	    		    "render": function ( data, type, row, meta ) {
	    		    /* 将当前值传入controller */	  
	    		    /*  <button class="button button-3d button-action button-circle button-jumbo"  ><i class="fa fa-thumbs-up">编辑</i></button> */
	    		     return '<a href="./admin_tongzhi3.shtml?id='+row.id+'" class="button button-primary button-rounded button-small" style="font-size: 14px;">编辑</a>\
	    		    		&emsp;&emsp;&emsp;\
	    		    		<a href="./tongzhi_delete.shtml?id='+row.id+'" onclick="return dd();" class="button button-primary button-rounded button-small" style="font-size: 14px;">删除</a>';	 	    		    			
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
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    ///CKEDITOR.replace('editor1')
    //bootstrap WYSIHTML5 - text editor
    //$('.textarea').wysihtml5()
  })
</script>

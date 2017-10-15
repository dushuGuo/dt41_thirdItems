<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script>
/*  修改JS */
 $(function () {
	 
	 $('#example3').DataTable({
	      'paging'      : true,
	      'lengthChange': false,
	      'searching'   : true,
	      'ordering'    : true,
	      'info'        : true,
	      'autoWidth'   : false
	    })
	 
	 $.post("admin_shuju_table.shtml",function(data){
			  $.each(data,function(){
					var option= "<option value="+this.id+">"+this.name+"</option>";
	    		  $("#tid1").append(option);
	    		  $("#tid2").append(option);
				 }) 
		 })
		 
		 $("#tid1").change(function(){
			 var id=$("#tid1").val();
			 $.post("admin_shuju_datarelation.shtml",{"id":id},function(data){
			 	$("#col1").children().remove();
				 $.each(data,function(eve){
					 var columnname=this.columnname;
					 var option= "<option value="+(eve+1)+">"+columnname+"</option>";
					 if(columnname!=""){
			    		  $("#col1").append(option);
					 }
				}) 
			 })
		 })
		 
		  $("#tid2").change(function(){
			 var id=$("#tid2").val();
			 $.post("admin_shuju_datarelation.shtml",{"id":id},function(data){
			 	$("#col2").children().remove();
				 $.each(data,function(eve){
					 var columnname=this.columnname;
					 var option= "<option value="+(eve+1)+">"+this.columnname+"</option>";
					 if(columnname!=""){
				    	$("#col2").append(option);
					 }
				}) 
			 })
		 })
		 $("#submit").click(function(){
			 var tid1=$("#tid1").val();
			 var tid2=$("#tid2").val();
			 var col1=$("#col1").val();
			 var col2=$("#col2").val();
			 var name=$("#name").val();
			 $.post("insert_guanlian.shtml",{"tid1":tid1,"tid2":tid2,"col1":col1,"col2":col2,"name":name},function(data){
				 if(data>=1){
				 		alert("添加成功");
				 		location="admin_shuju1_2.shtml";
				 	}else if(data==-2){
				 		alert("统一维度列类型必须一致,添加失败");
				 	}else if(data<1){
				 		alert("添加失败");
				 	}
				 
			 })
		 })
		 
		 $(".state").change(function(){
			 var state=$(this).val();
			 var id=$(this).next().val();
			 var flag=false;
			 if(state==1){
			 	flag=confirm("确定启用吗?");
			}else{
				flag=confirm("确定禁用吗?");
			}
			 if(flag){
				 $.post("admin_shuju_updateByState.shtml",{"id":id,"state":state},function(data){
					 if(data>=1)
					  alert("修改成功");
					  else
						  alert("修改失败");
				 })
			 }else{
				location="admin_shuju1_2.shtml";
			 }
		 })
		 
		 
 })


</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })

</script>
<script language="jscript"> 
	function ee() { if(confirm("请确认是否通过?" )) return true; return false;  }
	function dd() { if(confirm("请确认是否不通过?" )) return true; return false;  }
</script> 
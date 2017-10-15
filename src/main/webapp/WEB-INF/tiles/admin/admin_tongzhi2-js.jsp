<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
      $("a").click(function(){       
            var hrefs = $(this).attr("href");
            if ($("input").val()!="" || CKEDITOR.instances.editor1.getData()!="") {
                $("a").attr("data-toggle","modal");
                $("a").attr("data-target","#myModal2")
                $("a").attr("id","identifier2");
                $('#myModal2').modal({
                  show:false,
                  backdrop:"static",
                  keyboard:false
                     }); 
                $("#oks2").click(function(){
                  CKEDITOR.instances.editor1.setData("");
                  $("a").removeAttr("data-toggle","modal");
                  $("a").removeAttr("data-target","#myModal2")
                  $("a").removeAttr("id","identifier2");
                  window.location.href = hrefs;
              
                })
                 
            }else{
                $("a").removeAttr("data-toggle","modal");
                $("a").removeAttr("data-target","#myModal2")
                $("a").removeAttr("id","identifier2");
              }
                

      })
</script>

<script type="text/javascript">
    $(".pull-right").click(function(){    
    $(".pull-right").attr("data-toggle","modal");
    $(".pull-right").attr("data-target","#myModal")
    $(".pull-right").attr("id","identifier");
    $('#myModal').modal({
      show:false,
      backdrop:"static",
      keyboard:false
    }); 
     });
</script>

<script type="text/javascript">
    $("#ok").click(function(){    
    $("#ok").attr("data-toggle","modal");
    $("#ok").attr("data-target","#myModal1")
    $("#ok").attr("id","identifier1");
    $('#myModal1').modal({
      show:false,
      backdrop:"static",
      keyboard:false
    }); 
     });
</script>
<script type="text/javascript">
    $("#oks").click(function(){
        $("input").val("");
        CKEDITOR.instances.editor1.setData("");      
    })
</script>
<script>
  $(function () {
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
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1')
    //bootstrap WYSIHTML5 - text editor
    $('.textarea').wysihtml5()
  })
</script>
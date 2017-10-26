$(document).ready(function() {


    $('.delb').click(function(){
//text of element(td) with class="id"
        var el = $(this).closest("tr").find(".id").text();
        console.log("el value id"+id)
//insert the text of class="id" to input class="iduser""
        $(".iduser").val(el)



    })

    $('#btnYes').click(function() {
        var user_id=$(".iduser").val()
        console.log("User id"+user_id);


        $(".edit_delete_form").attr("action","/admin/repairs/delete");
//  $(".edit_delete_form").show();



        $(".edit_delete_form").submit();
        $('#delete').modal('hide');


    });
})

jQuery('.editb').on('click', function() {
    $tr = $(this).closest('tr');
    /* alert("You want to edit vehicle with: Plate number " + $('.plate', $tr).text()
         + ", Brand: " + $('.brand', $tr).text()
         + ", Color: " + $('.color', $tr).text());*/
    $(".modal-body #plate").val(  $('.plate', $tr).text() );
    $(".modal-body #id").val(  $('.id', $tr).text() );
    $(".modal-body #brand").val(  $('.brand', $tr).text() );
    $(".modal-body #color").val(  $('.color', $tr).text() );
});

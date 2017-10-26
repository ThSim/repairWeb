jQuery('.editb').on('click', function() {
    $tr = $(this).closest('tr');
    /* alert("You want to edit vehicle with: Plate number " + $('.plate', $tr).text()
         + ", Brand: " + $('.brand', $tr).text()
         + ", Color: " + $('.color', $tr).text());*/
    $(".modal-body #dateTime").val(  $('.dateTime', $tr).text() );
    $(".modal-body #id").val(  $('.id', $tr).text() );
    $(".modal-body #status").val(  $('.status', $tr).text() );
    $(".modal-body #price").val(  $('.price', $tr).text() );
});

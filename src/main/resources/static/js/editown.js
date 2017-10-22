jQuery('.editb').on('click', function() {
    $tr = $(this).closest('tr');
    /* alert("You want to edit vehicle with: Plate number " + $('.plate', $tr).text()
         + ", Brand: " + $('.brand', $tr).text()
         + ", Color: " + $('.color', $tr).text());*/
    $(".modal-body #name").val(  $('.name', $tr).text() );
    $(".modal-body #surname").val(  $('.surname', $tr).text() );
    $(".modal-body #mail").val(  $('.mail', $tr).text() );
    $(".modal-body #pass").val(  $('.pass', $tr).text() );
    $(".modal-body #afm").val(  $('.afm', $tr).text() );
    $(".modal-body #address").val(  $('.address', $tr).text() );
});

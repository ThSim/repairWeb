jQuery('.plub').on('click', function() {
    $tr = $(this).closest('tr');

    $(".modal-body #id").val(  $('.id', $tr).text() );
});

jQuery('.goToVehicles').on('click', function() {
    $tr = $(this).closest('tr');
    $(".findVehicles #id").val(  $('.id', $tr).text() );
    $( ".findVehicles" ).submit();
});

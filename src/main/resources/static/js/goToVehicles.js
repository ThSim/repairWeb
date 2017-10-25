jQuery('.goToVehicles').on('click', function() {
    $tr = $(this).closest('tr');
    $(".findVehicles #id").val(  $('.id', $tr).text() );
    $( ".findVehicles" ).submit();
});

jQuery('.goToVehicles').on('mouseenter', function(){ $(this).parent().addClass('hovered'); })
    .on('mouseleave', function(){ $(this).parent().removeClass('hovered'); });

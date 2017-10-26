jQuery('.goToRepairs').on('click', function() {
    $tr = $(this).closest('tr');
    $(".findRepairs #id").val(  $('.id', $tr).text() );
    $( ".findRepairs" ).submit();
});

jQuery('.goToRepairs').on('mouseenter', function(){ $(this).parent().addClass('hovered'); })
    .on('mouseleave', function(){ $(this).parent().removeClass('hovered'); });

$(document).ready(function () {
    /* Get the checkboxes values based on the class attached to each check box */
    $("#but").click(function() {
        getValue();
    });
});

function getValue(){
    /* declare an checkbox array */
    var chkArray = [];

    /* look for all checkboes that have a class 'chk' attached to it and check if it was checked */
    $(".chk:checked").each(function() {
        chkArray.push($(this).val());
    });

    /* we join the array separated by the comma */
    var selected;
    selected = chkArray.join(',') ;

    /* check if there is selected checkboxes, by default the length is 1 as it contains one single comma */
    if(selected.length > 1){
        alert("You have selected " + selected);
    }else{
        alert("Please at least one of the checkbox");
    }
}









/*
jQuery('.plub').on('click', function() {
    $tr = $(this).closest('tr');

    $(".modal-body #id").val(  $('.id', $tr).text() );
});


$('#myform').on('change', 'input[type=checkbox]', function(e) {
    console.log(this.name+' '+this.value+' '+this.checked);

});
*/


//NA DOKIMASW AUTO :) :
//$('.Checkbox:checked').map(function() {return this.value;}).get()

//--------------------------------------

//function onClickHandler(){
//var chk=document.getElementById("box//id").value;

//use this value

//}

/*
//EDW einai to setaki tou
function handleClick(c) {
        display("Click, new value = " + cb.checked);
    }
function display(msg) {
    var p = document.createElement('p');
    p.innerHTML = msg;
    document.body.appendChild(p);
}
*/


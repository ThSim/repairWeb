$(document).ready(function() {
//$("#edit").click(function(){
//$("#editUserForm").validator('validate')
//})

$("#addUserButton").click(function(){
$('#addUserForm').trigger("reset");

$("#addUserForm").validator('update')
})



})
$(document).ready(function() {
$("#load").click(function(){
var repairDate=$("tr:last-child").find(".datetime").text();

$("#repairDateTime").val(repairDate);
console.log($("#loadMoreForm").serialize())


 $.ajax({
                                 		             method: "POST",
//                                 		             contentType: "application/json",
                                 		             url:"/load",
                                 		             data:$("#loadMoreForm").serialize(),
                                 		             dataType: 'script',
                                 		             timeout: 60000,

                                 		             success: function (data) {
                                 		                console.log(data)
                                                          alert(data);

                                 		             },
                                 		             error: function (e) {
                                 		             console.log(e);

                                 		             }
                                 			});

})
})


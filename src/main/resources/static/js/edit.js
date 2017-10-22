$(document).ready(function () {

    //toggle `popup` / `inline` mode
//    $.fn.editable.defaults.mode = 'popup';


    //make data editable
    $('.name').editable();
    $('.mail').editable();
    $('.surname').editable();
    $('.pass').editable();
    $('.afm').editable();
    $('.address').editable();
    $('.admin').editable();

    $('.editable').editable('toggleDisabled');
//change textyue of button edit->save

    var data_unedit = {};
    $('#enable').click(function () {
        $('.editable').editable('toggleDisabled');
        $('#save').show();
        $('#cancel').show();

//                    store unedit data

        data_unedit["name"] = $(".name").text();
        data_unedit["surname"] = $(".surname").text();
        data_unedit["pass"] = $(".pass").text();
        data_unedit["mail"] = $(".mail").text();
        data_unedit["address"] = $(".address").text();
        data_unedit["afm"] = $(".afm").text();
        data_unedit["id"] = $(".id_user").text();
        data_unedit["admin"] = false;
        console.log(data_unedit);

    })

    $("#cancel").click(function () {
        $('.name').text(data_unedit["name"]);
        $('.name').removeClass("editable-unsaved");

        $('.mail').text(data_unedit["mail"]);
        $('.mail').removeClass("editable-unsaved");

        $('.surname').text(data_unedit["surname"]);
        $('.surname').removeClass("editable-unsaved");

        $('.pass').text(data_unedit["pass"]);
        $('.pass').removeClass("editable-unsaved");

        $('.afm').text(data_unedit["afm"]);
        $('.afm').removeClass("editable-unsaved");

        $('.address').text(data_unedit["address"]);
        $('.address').removeClass("editable-unsaved");


        console.log(data_unedit["name"])
        $('#save').hide();
        $('#cancel').hide();
        $('.editable').editable('toggleDisabled');

    })

    $("#save").click(function () {
        var data = {};
        data["name"] = $(".name").text();
        data["surname"] = $(".surname").text();
        data["pass"] = $(".pass").text();
        data["mail"] = $(".mail").text();
        data["address"] = $(".address").text();
        data["afm"] = $(".afm").text();
        data["id"] = $(".id_user").text();
        data["admin"] = false;

        console.log(data);
//if($(".name").is(".editable-unsaved")){
//
//alert("NIIIICE")
//}

        $.ajax({
            method: "POST",
            contentType: "application/json",
            url: "owner/edit",
            data: JSON.stringify(data),
            dataType: 'json',
            timeout: 60000,
            success: function (data) {
                $('.editable').editable('toggleDisabled');
                $("#save").hide();
                $("#cancel").hide();
                console.log(data)
                alert(data);

            },
            error: function (e) {
                $(".name").text(" erorr");

                console.log(e);
//                                		                 $("#btn-save").prop("disabled", false);
//                                		                 //...
            }
        });


    })


});


//$("td").delegated(".editable-submit","click", function(){
//      $("#saed").text("save");
//});


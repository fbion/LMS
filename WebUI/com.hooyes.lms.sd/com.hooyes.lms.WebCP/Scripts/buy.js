/// <reference path="config.js" />
/// <reference path="jquery.min.js" />



$(function () {
    $(".paymentcb").click(function () {
        CountAmount();
    });

});

function CountAmount() {
    var total = 0;
    $(".paymentcb").each(function () {
        if ($(this).is(":checked")) {
            var ID = "#t_" + $(this).get(0).id
            total += parseFloat($(ID).val());
        }
    });
    $("#totalamount").text(total);
    $("#totalamount_input").val(total);
    ActiveNextBtn();
}

function ActiveNextBtn() {
    var amount = $("#totalamount_input").val();
    if (amount > 0) {
        $("#order_next_btn").removeAttr("disabled");
    } else {
        $("#order_next_btn").attr("disabled", "disabled");
    }
}


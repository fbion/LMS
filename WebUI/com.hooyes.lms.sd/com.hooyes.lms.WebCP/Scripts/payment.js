/// <reference path="config.js" />
/// <reference path="jquery.min.js" />


$(function () {


    $("#card_btn").click(function () {
        var SN = $("#card_sn").val();
        TopupByCards(SN);
    });

    $("#aguidcard").click(function () {
        $("#c_car_tr").toggle();
    });

    $("#pay_check_fail").click(function () {
        $("#OverLay").hide();
    });

    $("#pay_check_success").click(function () {
        RefreshOrderPage();
    });

    $("#pay_check_fail").click(function () {
        RefreshOrderPage();
    });

});



function TopupByCards(SN) {
    var p = { SN: SN }
    if (p.SN == null || p.SN == "") {
        alert("请输入充值卡号");
        $("#card_sn").focus();
        return false;
    }
    $.ajax({
        url: PaymentController + "TopupByCards",
        data: p,
        type: "POST",
        dataType: "JSON",
        success: function (data) {
            if (data.Code == 0) {
                RefreshOrdersData(function () {
                    alert("充值成功");
                    $("#card_sn").val("");
                });
            } else {
                alert("充值卡号不正确");
            }
        },
        error: function (x, y, z) {
            alert(x);
        }
    });

}

function RefreshOrdersData(fn) {

    var p = { ID: $("#ID").val(), Refresh: 1 }
    $.ajax({
        url: PaymentController + "OrdersData",
        data: p,
        type: "POST",
        dataType: "JSON",
        success: function (data) {
            if (data.Order.ID > 0) {
                $("#balance").text(data.Balance.Amount);
                $("#creditamout").text(data.Order.Credit);
                $("#cashamount").text(data.Order.Cash);
                $("#cashamount_input").val(data.Order.Cash);
                fn();
            }
        },
        error: function (x, y, z) {
            alert(x);
        }
    });

}

function UpdateParams(url, name, value) {
    var r = url;
    if (r != null && r != 'undefined' && r != "") {
        value = encodeURIComponent(value);
        var reg = new RegExp("(^|)" + name + "=([^&]*)(|$)");
        var tmp = name + "=" + value;
        if (url.match(reg) != null) {
            r = url.replace(eval(reg), tmp);
        }
        else {
            if (url.match("[\?]")) {
                r = url + "&" + tmp;
            }
            else {
                r = url + "?" + tmp;
            }
        }
    }
    return r;
}

function ShowTip() {
    var cash = $("#cashamount_input").val();
    if (cash > 0) {
        $("#OverLay").show();
    } else {
        $("#OrderForm").attr("target", "_self");
    }
    return true;
}

function RefreshOrderPage() {
    var Url = location.href;
    Url = UpdateParams(Url, "hash", new Date().valueOf());
    location.href = Url;
}


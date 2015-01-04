﻿/// <reference path="jquery.min.js" />
/// <reference path="jquery.validate.min.js" />
/// <reference path="config.js" />
/*
-- =============================================
--  Version: 1.0.0.2
--  Author:  hooyes
--  Create Date: 2013-12-13
--  Update Date: 2014-05-16
--  Desc:
-- =============================================
*/
function SignupPost() {
    if (ValidateSignupForm()) {
        var param = $("#signup_form").serialize();
        $.ajax({
            url: SignupController + "add",
            type: "POST",
            data: param,
            dataType: "json",
            success: function (data) {
                if (data.Code == 0) {
                    $("#l_IDCard").text($("#Text_IDCard").val());
                    $("#l_Name").text($("#Text_Name").val());
                    $("#signup_div").hide();
                    $("#signup_finish").fadeIn();
                } else {
                    switch (data.Code) {
                        case 101:
                            alert("身份证号错误，请输入正确的身份证号");
                            break;
                        case 102:
                            alert("手机号错误，请输入正确的手机号");
                            break;
                        case 103:
                            alert("身份证号已注册，请直接使用身份号与姓名登录系统");
                            break;
                        default:
                            alert("信息提交错误，请检查后再试");
                            break;
                    }
                }
            },
            error: function (x, y, z) {
                alert("错误,请重试");
            }
        });
    }
    return false;
}

function ValidateSignupForm() {
    return $("#signup_form").valid();
}

jQuery.validator.addMethod("SName", function (value, element) {
    return this.optional(element) || /^[\u4e00-\u9fa5]{2,10}$/i.test(value);
});
jQuery.validator.addMethod("IDCard", function (value, element) {
    return this.optional(element) || /(^\d{6}(19|20)\d{2}([0][1-9]|10|11|12)([0,1,2][0-9]|[3][0,1])\d{3}([0-9]|X|x)$)/.test(value);   /* (^\d{17}([0-9]|X)$) */
});
jQuery.validator.addMethod("IDSN", function (value, element) {
    return this.optional(element) || /^[A-Za-z0-9]{16}$/.test(value);
});
jQuery.validator.addMethod("IDCert", function (value, element) {
    return this.optional(element) || /^[0-9]{1,25}$/.test(value);
});
jQuery.validator.addMethod("Phone", function (value, element) {
    return this.optional(element) || /^1[3|4|5|7|8][0-9]\d{8}$/.test(value);
});
$(function () {
    $("#signup_btn").click(function () {
        if (ValidateSignupForm()) {
            SignupPost();
        }
    });

    var cnmsg = {
        required: "必填",
        SName: "名字有误",
        IDCard: "身份证号有误",
        IDSN: "报名序号有误",
        IDCert: "会计证号有误",
        Phone: "手机号有误"
    };
    $.extend($.validator.messages, cnmsg);
    $("#signup_form").validate();
});

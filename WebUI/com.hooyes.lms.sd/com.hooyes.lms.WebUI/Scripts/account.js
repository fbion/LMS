/// <reference path="jquery.min.js" />
/// <reference path="config.js" />
function Login() {
    if (ValidateLoginForm()) {
        var param = $("#login_form").serialize();
        $.ajax({
            url: LoginController + "CheckWithNoCaptcha",
            type: "POST",
            data: param,
            dataType: "json",
            success: function (data) {
                if (data.Code == 0) {
                    window.location = AccountController + "Landing";
                } else {
                    switch (data.Code) {
                        case 197:
                            alert("验证码错误");
                            break;
                        case 203:
                            alert("对不起，根据山东财政厅文件规定，您未在规定的时间完成继续教育任务，请您重新缴费听课！");
                            break;
                        case 501:
                            alert("尊敬的学员：\r\n\n您的帐号已在别处(" + data.Message + ")登录，不能重复登录。\n\n");
                            break;
                        default:
                            alert("验证失败\r\n\n请输入正确的身份号和姓名");
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
function ValidateLoginForm() {
    var ID = $("#ID");
    var PWD = $("#PWD");
    var Captcha = $("#Captcha");
    if (ID.val() == "") {
        alert("请输入\t身份证号");
        ID.focus();
        return false;
    }
    if (PWD.val() == "") {
        alert("请输入\t姓名");
        PWD.focus();
        return false;
    }
//    if (Captcha.val() == "") {
//        alert("请输入\t验证码");
//        Captcha.focus();
//        return false;
//    }

    return true;

}
function CaptchaRefresh(o) {
    var src = $(o).attr("src");
    var hash = "hash=" + new Date().valueOf();
    src = src.replace(/hash=[0-9]*/, hash);
    $(o).attr("src", src);
}

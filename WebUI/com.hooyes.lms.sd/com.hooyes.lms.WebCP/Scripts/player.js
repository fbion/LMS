/// <reference path="jquery.min.js" />
/// <reference path="config.js" />
/* Author: hooyes     
Create Date: 2011-12-10
Update Date: 2012-03-12
*/
var TimeStart = new Date().valueOf();
var TimeEnd = new Date().valueOf();
var Suspend = false;
function PlayerAPI() { }
PlayerAPI.prototype.LMSInitialize = function () {
    TimeStart = new Date().valueOf();
    PlayerAPI.Log("LMSInitialize");
    return true;
}
PlayerAPI.prototype.LMSSetValue = function (name, value) {
    switch (name) {
        case 'cmi.core.lesson_location':
            if (!Suspend) {
                LMS.FlushTime();
            }
            break;
        case 'cmi.core.lesson_status':
            if (value == "completed") {
                LMS.FlushTime(1);
            }
            break;
        case 'cmi.core.exit':

            break;
        case 'cmi.core.session_time':

            break;
        case 'cmi.core.suspend_data':
            if (value == "suspend") {
                if (!Suspend) {
                    LMS.FlushTime();
                }
                Suspend = true;
            }
            if (value == "continue") {
                TimeStart = new Date().valueOf();
                Suspend = false;
            }
            break;

    }
    PlayerAPI.Log("SET:" + name + "|" + value);
    return true;
}
PlayerAPI.prototype.LMSGetValue = function (name) {
    var rValue = "";
    switch (name) {
        case "cmi.core.lesson_status":
            rValue = "incomplete";
            break;
        case "cmi.core.lesson_location": //本章节
            rValue = "01";
            break;
        case "cmi.core.entry":
            rValue = "01";
            break;
    }
    if (rValue == null) {
        rValue = "";
    }

    PlayerAPI.Log("get:" + name + "|" + rValue);
    return rValue;
}
PlayerAPI.prototype.LMSFinish = function () {
    
    return true;
}
PlayerAPI.prototype.LMSCommit = function () {
    
    return true;
}
PlayerAPI.prototype.LMSGetLastError = function () {
    return 0;
}
PlayerAPI.prototype.LMSGetErrorString = function () {
}
PlayerAPI.prototype.LMSGetDiagnostic = function () {
}
PlayerAPI.Log = function (str) {
     $("#log").append("<li>" + str + "</li>").scrollTop(3000);
}

function LMSAPI() {}
LMSAPI.prototype.UpdateCC = function (CID, CCID, Second, Status) {
    var param = { CID: CID, CCID: CCID, Second: Second, Status: Status };
    $.ajax({
        url: AccountController + "UpdateCC",
        type: "POST",
        data: param,
        dataType: "json",
        success: function (data) {

        },
        error: function (x, y, z) {

        }
    });
}
LMSAPI.prototype.FlushTime = function (Status) {
    if (Status == null) {
        status = 0;
    }
    TimeEnd = new Date().valueOf();
    var Second = Math.floor((TimeEnd - TimeStart) / 1000);
    this.UpdateCC(CID, CCID, Second, Status);
    TimeStart = new Date().valueOf();
}
LMSAPI.prototype.QShow = function () {
    this.FlushTime();
    Suspend = true;
    $("#ifr").hide();
    $.blockUI({ message: $("#question"), css: { width: '475px'} });
}
LMSAPI.prototype.QHide = function () {
    TimeStart = new Date().valueOf();
    Suspend = false;
    $.unblockUI();
    $("#ifr").show();
}
LMSAPI.prototype.QStart = function () {
    setTimeout(function () {
        LMS.QShow();
    }, 60000);
}

window.API = new PlayerAPI();
window.LMS = new LMSAPI();


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function registerSubmitForm()
{
    // alert("Enter a number");
    //$(".userNameAlert").text("Enter the Email");
    var regFlag = true;
    $(".userNameAlert").hide();
    //username
    var inp = $("#username").val();

    if (inp === "") {
        $(".userNameAlert").text("Please enter your username");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }
    //email 
    var inp = $("#email").val();

    if (inp === "") {
        $(".userNameAlert").text("Please enter your email");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }
    //company
    var inp = $("#company").val();

    if (inp === "") {
        $(".userNameAlert").text("Please enter your company");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }
    //password
    var inp = $("#password").val();
    if (inp === "") {
        $(".userNameAlert").text("Please enter the password");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }
    //confirm password
    var inp = $("#confirm-password").val();
    if (inp === "") {
        $(".userNameAlert").text("Please enter the confirm password");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }


    var pass = $("#password").val();

    if (pass.length < 8)
    {
        $(".userNameAlert").text("Please enter password atleast 8 digit");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }

    var pass = $("#password").val();
    
    if (!(pass.match(/([a-z])/))) {
        $(".userNameAlert").text("Please enter atleast one small aplhabet");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }
    if (!(pass.match(/([A-Z])/))) {
        $(".userNameAlert").text("Please enter atleast one capital aplhabet");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }

    if (!(pass.match(/([0-9])/))) {
        $(".userNameAlert").text("Please enter atleast one numeric digit");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }
    if (!pass.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) {
        $(".userNameAlert").text("Please enter atleast one special character");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }


    //password and confirm password
    var pass = $("#password").val();
    var conpass = $("#confirm-password").val();
    if (pass !== conpass)
    {
        $(".userNameAlert").text("Password and Confirm Password should be same");
        $(".userNameAlert").show();
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        regFlag = false;
        return regFlag;
    }
    console.log("regFlag--", regFlag);
    return regFlag;
}
;

function myFunction() {
    $(".userNameAlert").hide();
}
//            function submitForm() {
//                document.LoginForm.action = "RegistrationAction.do";
//                document.getElementById('username').focus();
//                document.LoginForm.method = "POST";
//                document.LoginForm.submit();
//            }
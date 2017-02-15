<%-- 
    Document   : registration
    Created on : 6 Nov, 2016, 8:07:51 PM
    Author     : sasi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html> 
<html lang="en" ng-app="registerApp" ng-controller="registerController" data-ng-cloak>
    <head>
        <meta charset="utf-8">
        <title>Xchedule</title>
        <meta name="description" content="Marino, Admin theme, Dashboard theme, AngularJS Theme">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="shortcut icon" href="favicon.ico">
        <!--[if IE]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]--><!-- global stylesheets --> 
        <link rel="stylesheet" href="css/components/bootstrap.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/1.0.0/css/flag-icon.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/styles/main.css">
    </head>
    <body data-layout="empty-layout" data-palette="palette-0" data-direction="none">
        <div class="fullsize-background-image-1"> <img src="images/backgrounds/bg60.png"> </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="create-account-page text-center animated fadeIn delay-2000">
                        <h1> Reset password </h1>
                        <h4> Please reset your password to login your account </h4>
                        <div class="row">
                            <div class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-6 col-md-offset-3 col-md-6 col-lg-offset-4 col-lg-4">
                                 <span class="userNameAlert" style="color: red; text-align: center; font-weight: 300;font-size: 13px; line-height: 24px;"></span>
                                <form id="ResetPasswordForm" name="ResetPasswordForm" method="post" action="ResetPasswordAction.do" >
                                    <div class="row">
                                        
                                        <div class="col-xs-12 col-xl-6">
                                            <div class="form-group floating-labels">
                                                <label for="email">Email</label> <input id="email" autocomplete="off" type="email" name="email" data-ng-model="email" readonly="true"/> 
                                                <p class="error-block"></p>												
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-xl-6">
                                            <div class="form-group floating-labels">
                                                <label for="password">Password</label> <input id="password" autocomplete="off" type="password" name="password" onblur="myFunction()"> 
                                                <p class="error-block"></p>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-xl-6">
                                            <div class="form-group floating-labels">
                                                <label for="confirm-password">Confirm password</label> <input id="confirm-password" autocomplete="off" type="password" name="confirm-password" onblur="myFunction()"> 
                                                <p class="error-block"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <br> 
                                    <div class="row buttons">
                                        <div class="col-xs-12"> <input type="submit" class="btn btn-lg btn-info btn-block no-border" value="Submit"> </div>
                                    </div>
									
                                </form>
                                 <p>Already have an account?<a href="/scheduler" style="color: rgb(0,255,0)"><font color="FF00CC">Click here to Login</font></a></p>
                                <p>New user? <!--<a class="link" href="pages-register.html">Click here to create an account</a> -->
                                <a href="/scheduler/Register.do" style="color: rgb(0,255,0)"><font color="FF00CC">Click here to create an account</font></a></p>
                            </div>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
        <script>
            function trim(value) {
                return LTrim(RTrim(value));
            }
            /*function submitForm() {
                document.LoginForm.action = "ResetPasswordAction.do";
                document.getElementById('username').focus();
                document.LoginForm.method = "POST";
                document.LoginForm.submit();
            }
            */

        </script>
        <!-- global scripts --> 
        <script src="js/components/jquery/jquery.js"></script> 
        <script src="js/components/tether/tether.js"></script>
        <script src="js/components/bootstrap/bootstrap.js"></script> 
        <script src="js/components/pace/pace.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.0.0/lodash.min.js"></script>
        <script src="js/components/jquery/jquery-fullscreen/jquery.fullscreen-min.js"></script>
        <script src="js/components/jquery/jquery.storageapi.min.js"></script>
        <script src="js/components/wow/wow.min.js"></script>
        <script src="js/components/common/functions.js"></script> 
        <script src="js/components/common/colors.js"></script> 
        <script src="js/components/common/left-sidebar.js"></script>
        <script src="js/components/common/navbar.js"></script> 
        <script src="js/components/common/horizontal-navigation-1.js"></script>
        <script src="js/components/common/horizontal-navigation-2.js"></script> 
        <script src="js/components/common/horizontal-navigation-3.js"></script> 
        <script src="js/components/common/main.js"></script> 
        <script src="js/components/common/floating-labels.js"></script>
        <script src="js/components/common/pages-login.js"></script> 
         <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script src="js/registration.js"></script> 
         <script src="loginRegistration/scripts/controllers/registerController.js"></script> 
         <script src="loginRegistration/scripts/services/registerService.js"></script> 
        
        <script>
		
		window.onload = function(){
			var str=window.location.search.substr(1);
			document.getElementById("email").value = str.split("=")[1];
			
			//alert(window.location.search.substring(1));
		}
            function strengthMeter(passwordFieldId, nodes) {

    // init undefined 
    if ('undefined' === typeof(nodes)) {
        var nodes = 1;
    }   
    
    // init character classes
    var password = $("#" + passwordFieldId).attr('value');
    var numEx = /\d/;
    var lcEx = /[a-z]/;
    var ucEx = /[A-Z]/;
    var syEx = /\W/;
    var meterMult = 1;
    var character_set_size = 0;
    
    // loop over each char of the password and check it per regexes above.
    // weight numbers, upper case and lowercase at .75, 1 and .25 respectively.
    if (numEx.test(password)) {
        character_set_size += 10;
    }
    if (ucEx.test(password)) {
        character_set_size += 26;
    }
    if (lcEx.test(password)) {
        character_set_size += 26;
    }
    if (syEx.test(password)) {
        character_set_size += 32;
    }

    // assume that 100% is a meterMult of maxMulti
    var strength = Math.pow(character_set_size, password.length);

    // init crackers at hashes/second
    // all numbers from slowest computer here http://hashcat.net/oclhashcat-plus/
    var rateMd5 = 1333000000; 
    var rateSHA1 = 433000000;
    var rateMd5crypt = 855000;
    var rateBcrypt = 604;
        
    // calculate a human readable time based on seconds and nodes
    var secMd5 = secondsToStr(toFixed(strength/(rateMd5*nodes))); 
    var secSHA1 = secondsToStr(toFixed(strength/(rateSHA1*nodes)));
    var secMd5crypt = secondsToStr(toFixed(strength/(rateMd5crypt*nodes)));
    var secBcrypt = secondsToStr(toFixed(strength/(rateBcrypt*nodes)));
    
    var rates = "MD5: " + secMd5 + " <br/>" +
        "SHA1: " + secSHA1 +  "<br/>" +
        "MD5Crypt: " + secMd5crypt + "<br/>" +
        "Bcrypt: " + secBcrypt + "<br/>" +
       " ";
    
    // if null, don't show anything
    if (password.length > 0) {
        $("#passwordIndicator").show();
        $("#possibilities").html(numberWithCommas(strength) + " Possibilities");
        $("#nodes").val(nodes);
        $("#rates").html(rates);
    } else {
        $("#passwordIndicator").hide();
    }
    
}

$(document).ready(function() {
    $("#fmPass").keyup(function(event) {
        strengthMeter("fmPass",$("#nodes").val());
    });
    $("#nodes").keyup(function(event) {
        strengthMeter("fmPass", $("#nodes").val());
    });
    strengthMeter("fmPass",$("#nodes").val());
});






// thanks http://stackoverflow.com/questions/2901102/how-to-print-number-with-commas-as-thousands-separators-in-javascript
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// thanks http://stackoverflow.com/questions/8211744/convert-milliseconds-or-seconds-into-human-readable-form
function secondsToStr(seconds){
    // TIP: to find current time in milliseconds, use:
    // var milliseconds_now = new Date().getTime();
    seconds = Math.round(seconds);
    var numyears = Math.floor(seconds / 31536000);
    if(numyears){
        return numberWithCommas(numyears) + ' year' + ((numyears > 1) ? 's' : '');
    }
    var numdays = Math.floor((seconds % 31536000) / 86400);
    if(numdays){
        return numdays + ' day' + ((numdays > 1) ? 's' : '');
    }
    var numhours = Math.floor(((seconds % 31536000) % 86400) / 3600);
    if(numhours){
        return numhours + ' hour' + ((numhours > 1) ? 's' : '');
    }
    var numminutes = Math.floor((((seconds % 31536000) % 86400) % 3600) / 60);
    if(numminutes){
        return numminutes + ' minute' + ((numminutes > 1) ? 's' : '');
    }
    var numseconds = (((seconds % 31536000) % 86400) % 3600) % 60;
    if(numseconds){
        return numseconds + ' second' + ((numseconds > 1) ? 's' : '');
    }
    return 'less then a second'; //'just now' //or other string you like;
}

// thanks http://stackoverflow.com/questions/1685680/how-to-avoid-scientific-notation-for-large-numbers-in-javascript
function toFixed(x) {
  if (Math.abs(x) < 1.0) {
    var e = parseInt(x.toString().split('e-')[1]);
    if (e) {
        x *= Math.pow(10,e-1);
        x = '0.' + (new Array(e)).join('0') + x.toString().substring(2);
    }
  } else {
    var e = parseInt(x.toString().split('+')[1]);
    if (e > 20) {
        e -= 20;
        x /= Math.pow(10,e);
        x += (new Array(e+1)).join('0');
    }
  }
    return x;
}

// thanks http://stackoverflow.com/questions/995183/how-to-allow-only-numeric-0-9-in-html-inputbox-using-jquery
    $("#nodes").keydown(function(event) {
        // Allow: backspace, delete, tab, escape, and enter
        if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 || 
             // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) || 
             // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        else {
            // Ensure that it is a number and stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                event.preventDefault(); 
            }   
        }
    });
function strengthMeter(passwordFieldId, nodes) {

    // init undefined 
    if ('undefined' === typeof(nodes)) {
        var nodes = 1;
    }   
    
    // init character classes
    var password = $("#" + passwordFieldId).attr('value');
    var numEx = /\d/;
    var lcEx = /[a-z]/;
    var ucEx = /[A-Z]/;
    var syEx = /\W/;
    var meterMult = 1;
    var character_set_size = 0;
    
    // loop over each char of the password and check it per regexes above.
    // weight numbers, upper case and lowercase at .75, 1 and .25 respectively.
    if (numEx.test(password)) {
        character_set_size += 10;
    }
    if (ucEx.test(password)) {
        character_set_size += 26;
    }
    if (lcEx.test(password)) {
        character_set_size += 26;
    }
    if (syEx.test(password)) {
        character_set_size += 32;
    }

    // assume that 100% is a meterMult of maxMulti
    var strength = Math.pow(character_set_size, password.length);

    // init crackers at hashes/second
    // all numbers from slowest computer here http://hashcat.net/oclhashcat-plus/
    var rateMd5 = 1333000000; 
    var rateSHA1 = 433000000;
    var rateMd5crypt = 855000;
    var rateBcrypt = 604;
        
    // calculate a human readable time based on seconds and nodes
    var secMd5 = secondsToStr(toFixed(strength/(rateMd5*nodes))); 
    var secSHA1 = secondsToStr(toFixed(strength/(rateSHA1*nodes)));
    var secMd5crypt = secondsToStr(toFixed(strength/(rateMd5crypt*nodes)));
    var secBcrypt = secondsToStr(toFixed(strength/(rateBcrypt*nodes)));
    
    var rates = "MD5: " + secMd5 + " <br/>" +
        "SHA1: " + secSHA1 +  "<br/>" +
        "MD5Crypt: " + secMd5crypt + "<br/>" +
        "Bcrypt: " + secBcrypt + "<br/>" +
       " ";
    
    // if null, don't show anything
    if (password.length > 0) {
        $("#passwordIndicator").show();
        $("#possibilities").html(numberWithCommas(strength) + " Possibilities");
        $("#nodes").val(nodes);
        $("#rates").html(rates);
    } else {
        $("#passwordIndicator").hide();
    }
    
}

$(document).ready(function() {
    $("#fmPass").keyup(function(event) {
        strengthMeter("fmPass",$("#nodes").val());
    });
    $("#nodes").keyup(function(event) {
        strengthMeter("fmPass", $("#nodes").val());
    });
    strengthMeter("fmPass",$("#nodes").val());
});






// thanks http://stackoverflow.com/questions/2901102/how-to-print-number-with-commas-as-thousands-separators-in-javascript
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// thanks http://stackoverflow.com/questions/8211744/convert-milliseconds-or-seconds-into-human-readable-form
function secondsToStr(seconds){
    // TIP: to find current time in milliseconds, use:
    // var milliseconds_now = new Date().getTime();
    seconds = Math.round(seconds);
    var numyears = Math.floor(seconds / 31536000);
    if(numyears){
        return numberWithCommas(numyears) + ' year' + ((numyears > 1) ? 's' : '');
    }
    var numdays = Math.floor((seconds % 31536000) / 86400);
    if(numdays){
        return numdays + ' day' + ((numdays > 1) ? 's' : '');
    }
    var numhours = Math.floor(((seconds % 31536000) % 86400) / 3600);
    if(numhours){
        return numhours + ' hour' + ((numhours > 1) ? 's' : '');
    }
    var numminutes = Math.floor((((seconds % 31536000) % 86400) % 3600) / 60);
    if(numminutes){
        return numminutes + ' minute' + ((numminutes > 1) ? 's' : '');
    }
    var numseconds = (((seconds % 31536000) % 86400) % 3600) % 60;
    if(numseconds){
        return numseconds + ' second' + ((numseconds > 1) ? 's' : '');
    }
    return 'less then a second'; //'just now' //or other string you like;
}

// thanks http://stackoverflow.com/questions/1685680/how-to-avoid-scientific-notation-for-large-numbers-in-javascript
function toFixed(x) {
  if (Math.abs(x) < 1.0) {
    var e = parseInt(x.toString().split('e-')[1]);
    if (e) {
        x *= Math.pow(10,e-1);
        x = '0.' + (new Array(e)).join('0') + x.toString().substring(2);
    }
  } else {
    var e = parseInt(x.toString().split('+')[1]);
    if (e > 20) {
        e -= 20;
        x /= Math.pow(10,e);
        x += (new Array(e+1)).join('0');
    }
  }
    return x;
}

// thanks http://stackoverflow.com/questions/995183/how-to-allow-only-numeric-0-9-in-html-inputbox-using-jquery
    $("#nodes").keydown(function(event) {
        // Allow: backspace, delete, tab, escape, and enter
        if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 || 
             // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) || 
             // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        else {
            // Ensure that it is a number and stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                event.preventDefault(); 
            }   
        }
    });

        </script>
    </body>
</html>
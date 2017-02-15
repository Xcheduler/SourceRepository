/**
 * @author Batch Themes Ltd.
 */
(function () {
    'use strict';

    $(function () {

        var config = $.localStorage.get('config');
        $('body').attr('data-layout', 'fullsize-background-image');
        $('body').attr('data-palette', config.theme);
        $('body').attr('data-direction', config.direction);

        var email = $('.login-page #email');
        email.floatingLabels({
            errorBlock: 'Please enter your email',
            isEmailValid: 'Please enter a valid email'
        });

        var password = $('.login-page #password');
        password.floatingLabels({
            errorBlock: 'Please enter a valid password',
            minLength: 6
        });

        $('.login-page .btn-login').click(function (e) {
            $(".userNameAlert").hide();
            $(".error-block").show();
            var inp = $("#email").val();
            var flag = true;
            if (inp === "") {
                $(".userNameAlert").text("Please enter your email");
                $(".userNameAlert").show();
                $("html, body").animate({
                    scrollTop: 0
                }, "slow");
                flag = false;
                return flag;
            }

            var inp = $("#password").val();
            if (inp === "") {
                $(".userNameAlert").text("Please enter the password");
                $(".userNameAlert").show();
                $("html, body").animate({
                    scrollTop: 0
                }, "slow");
                flag = false;
                return flag;
            }
            console.log("flaf----", flag);
            if(flag == true){
				console.log("sahdfadfkkj");
                 document.LoginForm.action = "LoginAction.do";
                document.getElementById('email').focus();
                document.LoginForm.method = "POST";
                document.LoginForm.submit();
                 return flag;
            }
           
        });
    });

})();

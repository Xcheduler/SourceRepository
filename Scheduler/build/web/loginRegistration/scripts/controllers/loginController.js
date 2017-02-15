(function () {
    'use strict';
    angular.module('loginApp', []).controller('loginController', loginController);

    loginController.$inject = ['$scope', '$http', '$window', 'loginService'];
    function loginController($scope, $http, $window, loginService) {
        console.log("crkingheck as wo--- loginContckroller..kumar.");
        $scope.checkEmailExist = checkEmailExist;
        $scope.loginSubmit = loginSubmit;

        //To check Email Exist

        function checkEmailExist() {
            console.log("checkEmailExist---", $scope.email);
            loginService.checkEmailExist($scope.email).then(
                    function success(response) {
                        var data = response.data;
                        console.log("var data = response.data;---", data);
                        if (data == false) {
                            $(".userNameAlert").text("Please enter the Register Email address");
                            $(".userNameAlert").show();
                            $("html, body").animate({
                                scrollTop: 0
                            }, "slow");
                        }else{
                            $(".userNameAlert").hide();
                        }
                    }, function error() {

            });
        }
        
        //To Login 
        
         function loginSubmit() {
            console.log("loginSubmit---", $scope.email);
            var loginObj={
                "email" : $scope.email,
                "password" : $scope.password
            }
        
            var email = escape(angular.toJson(loginObj));
            console.log("email------>",email);

            loginService.loginSubmit(loginObj).then(
                    function success(response) {
                        var data = response.data;
                        console.log("var data = response.data;---", data);
                        if (data == false) {
                            $(".userNameAlert").text("Please enter the Register Email address");
                            $(".userNameAlert").show();
                            $("html, body").animate({
                                scrollTop: 0
                            }, "slow");
                        }else{
                            $(".userNameAlert").hide();
                        }
                    }, function error() {

            });
        }
    }
})();
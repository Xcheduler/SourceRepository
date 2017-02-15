(function () {
    'use strict';
    angular.module('registerApp', []).controller('registerController', registerController);

    registerController.$inject = ['$scope', '$http', '$window', 'registerService'];
    function registerController($scope, $http, $window, registerService) {
        console.log("crkingheck as wo--- loginContckroller..kumar.");
        $scope.checkEmailExist = checkEmailExist;

        //To check Email Exist

        function checkEmailExist() {
            console.log("checkEmailExist---", $scope.email);
            registerService.checkEmailExist($scope.email).then(
                    function success(response) {
                        var data = response.data;
                        console.log("var data = response.data;---", data);
                        if (data == true) {
                            $(".userNameAlert").text("Entered Email address already exists");
                            $(".userNameAlert").show();
                            $("html, body").animate({
                                scrollTop: 0
                            }, "slow");
                        } else {
                            $(".userNameAlert").hide();
                        }
                    }, function error() {

            });
        }

    }
})();
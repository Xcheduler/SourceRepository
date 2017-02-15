(function () {
    'use strict';
    angular.module('loginApp').factory('loginService', loginService);

    loginService.$inject = ['$http'];
    function loginService($http) {
        var serviceMethods = {
            checkEmailExist: checkEmailExist,
            loginSubmit : loginSubmit
        };

        return serviceMethods;

        function checkEmailExist(email) {
            console.log("Service method-check exist--", email);           
            var req = {
                method: 'POST',
                url: '/scheduler/RegisterServlet',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: email
            };
            return $http(req);
        }
        
        //To Login submit
         function loginSubmit(loginObj) {
            console.log("login method--", loginObj);           
            var req = {
                method: 'POST',
                url: '/LoginAction.do',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: loginObj
            };
            return $http(req);
        }
        

    }

})();
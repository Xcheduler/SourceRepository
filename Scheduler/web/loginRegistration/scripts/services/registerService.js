(function () {
    'use strict';
    angular.module('registerApp').factory('registerService', registerService);

    registerService.$inject = ['$http'];
    function registerService($http) {
        var serviceMethods = {
            checkEmailExist: checkEmailExist
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
    }

})();
(function() {
	'use strict';
	angular.module('FLSPCSetPassword').factory('passwordService', passwordService);
	
	passwordService.$inject = [ '$http'];
	function passwordService($http) {
		var serviceMethods = {
				passwordSubmit : passwordSubmit
			};

			return serviceMethods;
			function passwordSubmit(email,token, password, cfmPassword) {
				var req = {
							method : 'POST',
							url : '/rest/model/atg/userprofiling/ForgotPasswordActor/changePassword',
							headers : {
								'Content-Type' : 'application/json',
							},
							data : {
								'email' : email,
								'tokenId':token,
								'password':password,
								'confirmPassword':cfmPassword
							}
						
							
					};
					return $http(req);
			}
	}
	
})();
(function() {
	'use strict';
	angular.module('FLSPCSetPassword', [ 'FLSPCValidator' ]).controller(
			'PCSetPasswordController', pcSetPasswordController);

	pcSetPasswordController.$inject = [ '$scope', '$state', 'passwordService' ];
	function pcSetPasswordController($scope, $state, passwordService) {
		$scope.email = $state.params.email;
		$scope.passwordSubmit = passwordSubmit;
		$(".userNameAlert").hide();

		//Set new password
		function passwordSubmit() {
			$(".loginUserErr").show();
			passwordService.passwordSubmit($state.params.email.toLowerCase(),$state.params.tokenID,
					$scope.password, $scope.cfmPassword).then(
					function success(response) {
						var data = response;
						if (data.formError == null
								|| data.formError == undefined
								|| data.formError == false) {
							$('#set-pwd-resetted').modal('show');

						} else {
							$(".userNameAlert").text(
									data.formExceptions[0].localizedMessage);
							$(".userNameAlert").show();
						}
					}, function error() {

					});
		}

	}
})();
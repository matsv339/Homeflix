angular.module('loginModule').controller('LoginController', function($scope, $http, Login) {
	$scope.redirect = function(){
		Login.index();
	};

	$scope.redirect();
});
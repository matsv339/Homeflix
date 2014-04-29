var userControllers = angular.module('userControllers', []);

userControllers.controller('UserController', function($scope, $http) {
	$http.get('/users.json').success(function(data) {
  		$scope.users = data;
  	});
});
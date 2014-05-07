var userControllers = angular.module('userControllers', ['serviceModule']);

userControllers.controller('UserController', function($scope, $http, Users) {
	$scope.users = Users.index();
	$scope.a = "hej";
});
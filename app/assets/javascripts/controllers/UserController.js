angular.module('userModule').controller('UserController', function($scope, $http, Users) {
	$scope.users = Users.index();
	$scope.a = "hej";
});
angular.module('userModule').controller('UserController', function($scope, $http, Users, Movies) {
	$scope.users = Users.index();
	$scope.a = "hej";

	
});
angular.module('userModule').controller('UserController', function($scope, $rootScope, $http, Users, Movies, Test) {
	$scope.users = Users.index();
	$scope.a = "hej";
	$scope.t = function() {
		console.log($rootScope.current_user);
		Test.email({oauth_token: $rootScope.current_user.oauth_token});
	}
});
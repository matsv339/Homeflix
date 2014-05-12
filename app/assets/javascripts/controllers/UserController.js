angular.module('userModule').controller('UserController', function($scope, Users, $rootScope) {
	//Just for testign differnet users
	$scope.users = Users.index();
	$scope.switch = function(id) {
		$rootScope.current_user = id;
	}	
});
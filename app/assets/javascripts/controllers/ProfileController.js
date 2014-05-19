angular.module('movieModule').controller('ProfileController', function($scope, $rootScope, Profile) {
	$scope.reasent_movies = Profile.last_watched({user_id: $rootScope.current_user.id});
});
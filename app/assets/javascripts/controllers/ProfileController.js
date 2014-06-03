angular.module('movieModule').controller('ProfileController', function($scope, $rootScope, Profile, Progresses) {
	
	//Show all resent movies
	$scope.reasent_movies = Profile.last_watched({user_id: $rootScope.current_user.id}, function(data) {
		$scope.hasHistory = data.length != 0
	});

	//Removes the resent movie from resent movie list if clicked by user
	$scope.remove_reasent = function($index) {
		
		imdb_id = $scope.reasent_movies[$index].data.imdb_id;

		Progresses.destroy({imdb_id: imdb_id, user_id: $rootScope.current_user.id}, function(data) {
			$scope.reasent_movies.splice($index,1);
		});
	}
});
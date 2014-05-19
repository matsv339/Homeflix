angular.module('homeModule').controller('HomeController', function($scope, $rootScope, LastMovies) {
	LastMovies.index(function(data) {
		$scope.movies = data;
		angular.forEach(data, function(value, key) {
			value.order = new Date(value.Released).getTime();
		});
			
	});
	
	// $scope.reasent_movies = Profile.last_watched({user_id: $rootScope.current_user.id});

	$scope.sliderInterval = 5000;  	
});
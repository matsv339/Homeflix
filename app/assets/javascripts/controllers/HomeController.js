angular.module('homeflix').controller('HomeController', function($scope, LastMovies) {
	
	//Fetches the last movies to the carousel
	LastMovies.index(function(data) {
		$scope.movies = data;
		angular.forEach(data, function(value, key) {
			value.order = new Date(value.Released).getTime();
		});
			
	});

	$scope.sliderInterval = 5000;  	
});
angular.module('homeModule').controller('HomeController', function($scope, LastMovies) {
	LastMovies.index(function(data) {
		$scope.movies = data;
		angular.forEach(data, function(value, key) {
			value.order = new Date(value.Released).getTime();
		});
			
	});
	$scope.sliderInterval = 5000;  	
});
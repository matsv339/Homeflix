angular.module('homeModule').controller('HomeController', function($scope, LastMovies, IMDB) {
	$scope.movies = LastMovies.index();
	$scope.sliderInterval = 5000;  	
});
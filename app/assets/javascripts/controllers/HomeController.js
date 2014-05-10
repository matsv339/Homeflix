angular.module('homeModule').controller('HomeController', function($scope, LastMovies) {
	$scope.movies = LastMovies.index();
	$scope.sliderInterval = 5000;  	
});
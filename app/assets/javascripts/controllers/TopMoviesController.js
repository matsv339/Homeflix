angular.module('movieModule').controller('TopMoviesController', function($scope, TopMovies) {
	$scope.top_movies = TopMovies.top_ratings();
});
angular.module('imdbModule').controller('IMDBController', function($scope, IMDB) {
	//Returns the movie data from imdb given an ID
    $scope.getMovie = function(imdbid) {
		IMDB.index({i: imdbid}, function(data) {
			$scope.movie = data;
		});
	}
});
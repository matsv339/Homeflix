angular.module('movieModule').controller('MovieDetailedController', function($scope, $routeParams, Movies) {
    $scope.imdb_id = $routeParams.imdb_id;
    $scope.rate = 3;
  	$scope.max = 5;
    Movies.search({key: $scope.imdb_id}, function(data) {
		$scope.movie = data[0];
		$scope.rate = Math.round($scope.movie.imdbRating/2);
    });
});
angular.module('movieModule').controller('MovieDetailedController', function($scope, $routeParams, IMDB) {
    $scope.imdb_id = $routeParams.imdb_id;

    IMDB.index({i: $scope.imdb_id}, function(data) {
        $scope.movie = data;
        $scope.rating = new Array(Math.round($scope.movie.imdbRating/2));
    });
});
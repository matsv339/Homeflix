angular.module('movieModule').controller('MovieDetailedController', function($scope, $rootScope, $routeParams, Movies, Progresses) {
    $scope.valid_id = false;
    $scope.imdb_id = $routeParams.imdb_id;
    $scope.rate = 3;
  	$scope.max = 5;
    Movies.search({key: $scope.imdb_id}, function(data) {
		if (data[0]) {
			$scope.movie = data[0];	
			$scope.rate = Math.round($scope.movie.imdbRating/2);
			$scope.valid_id = true;
            Progresses.show({user_id: $rootScope.current_user.id, imdb_id: $scope.imdb_id}, function(data) {
                $scope.progress = data.progress;
            });
		};
    });
});
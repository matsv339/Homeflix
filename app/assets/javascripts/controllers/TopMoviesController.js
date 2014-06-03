angular.module('movieModule').controller('TopMoviesController', function($scope, TopMovies) {
	
	limit = 6 * 5;
	$scope.lower = 0;	
	$scope.upper = 6;
	step = 6;

	//Gets the top movies 
	TopMovies.top_ratings({limit: limit}, function(data) {
		
		$scope.top_movies = data;
		$scope.max = data.length;
		
		if (data.length > step) {
			$scope.isMore = true;	
		}
		else {
			$scope.isMore = false;
		}
		$scope.isLess = false;
	});	

	//Get the next 6 topmovies
	$scope.more_top = function() {
		if ($scope.upper < $scope.max) {
			$scope.lower = $scope.lower  + step;
			$scope.upper = $scope.upper  + step;
			$scope.isLess = true;
			if ($scope.upper > $scope.max) {
				$scope.isMore = false;
			};
		}
	};

	//Get the previous top 6 movies
	$scope.less_top = function() {
		if ($scope.lower > 0) {
			$scope.lower = $scope.lower  - step;
			$scope.upper = $scope.upper  - step;
			$scope.isMore = true;
			if ($scope.lower == 0) {
				$scope.isLess = false;
			};
		}
	};
});
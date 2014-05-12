angular.module('movieModule').controller('RatingsController', function($scope, $rootScope, $routeParams, Ratings) {
    $scope.imdb_id = $routeParams.imdb_id;
  	$scope.max = 5;
  	
  	Ratings.index({imdb_id: $scope.imdb_id}, function(data) {
  		$scope.average = data.average;
  		$scope.votes = data.votes;
  	});

    Ratings.show({user_id: $rootScope.current_user, imdb_id: $scope.imdb_id}, function(data) {
		if (data.respons == "null") {
			$scope.rate = 0;
			$scope.old_rating = 0;
			$scope.rating_text = "Rate this movie";
		}
		else {
			$scope.rate = data.rating;
			$scope.rating_text = "Your rating";
			$scope.rated = true;
			$scope.old_rating = $scope.rate;
		}
    });
    $scope.rateMovie = function() {
    	if ($scope.rated) {
    		Ratings.update({user_id: $rootScope.current_user, imdb_id: $scope.imdb_id, rating: $scope.rate}, function(data) {
    			$scope.average = ($scope.average * $scope.votes + $scope.rate - $scope.old_rating) / $scope.votes;
    			$scope.old_rating = $scope.rate;
    		});
    	} else {
    		Ratings.create({user_id: $rootScope.current_user, imdb_id: $scope.imdb_id, rating: $scope.rate}, function(data) {
    			$scope.average = ($scope.average * $scope.votes + $scope.rate) / ($scope.votes + 1);
    			$scope.old_rating = $scope.rate;
    			$scope.votes ++;
    			$scope.rated = true;
    			$scope.rating_text = "Your rating";
    		});
    	}
    	
    }
});
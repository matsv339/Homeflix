var movieController = angular.module('movieController', []);

movieController.controller('MovieController', function($scope, $http) {
	$http.get('/movies.json').success(function(data) {
		
  		$scope.movies = [];

  		for(var i = 0;i < 2; i++) {
  			$http.get('http://www.omdbapi.com/?i=' + data[i].imdbID).success(function(data) {
  				$scope.movies.push(data);
  			});
  		}
  	});
  	
});
var movieController = angular.module('movieController', []);

Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};

movieController.controller('MovieController', function($scope, $http) {

    $http.get('/movies.json').success(function(data) {
  		$scope.movies = [];
        size = Object.size(data);

  		for(var i = 0;i < size; i++) {
  			$http.get('http://www.omdbapi.com/?i=' + data[i].imdbID).success(function(data) {
  				$scope.movies.push(data);
  			});
  		}
  	});
  	
});
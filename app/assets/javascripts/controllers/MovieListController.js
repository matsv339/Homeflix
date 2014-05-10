angular.module('movieModule').controller('MovieListController', function($scope, Movies, IMDB) {
    //Old way
    // Movies.index(function(data) {
    	
    //     $scope.movies = [];
    //     for(var i = 0;i < data.length; i++) {
    //         IMDB.index({i: data[i].imdb_id}, function(data) {
    //             $scope.movies.push(data);
    //         });
    //     }
    // });
	$scope.movies = Movies.index();
});
angular.module('movieModule').controller('MovieListController', function($scope, Movies, IMDB, Genre) {

    $scope.genres = Genre.genres();
    $scope.query = {name: ""};
    $scope.filterGenre = function(name) {
    	console.log("hej");
    	$scope.query.name = name;
    };

});
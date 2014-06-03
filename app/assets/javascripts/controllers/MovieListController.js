angular.module('movieModule').controller('MovieListController', function($scope, Movies, Genre) {

	//Gets all movies by genres
    $scope.genres = Genre.genres();

    //Filter by genre
    $scope.query = {name: ""};
    $scope.filterGenre = function(name) {
    	$scope.query.name = name;
    };

});
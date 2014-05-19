angular.module('movieModule').controller('MovieListController', function($scope, Movies, IMDB, Genre) {

    $scope.genres = Genre.genres();

});
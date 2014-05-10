angular.module('navigationModule').controller('NavbarController', function($scope, $location, Movies) {
	$scope.isActive = function (viewLocation) { 
        return viewLocation === $location.path();
    };
    
    $scope.movies = Movies.index();

    $scope.onSelect = function($item, $model, $label) {
        console.log($model);
        $location.path("/movies/" + $model.imdb_id);
    };
});
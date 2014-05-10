angular.module('navigationModule').controller('NavbarController', function($scope, $location, Movies) {
	$scope.isActive = function (viewLocation) { 
        return viewLocation === $location.path();
    };

    $scope.onSelect = function($item, $model, $label) {
        console.log($model);
        $location.path("/movies/" + $model.imdb_id);
    };

    $scope.search = function(val) {
		// console.log(val);
		return Movies.search({key: val}).$promise.then(function(data) {
			var movies = [];
			angular.forEach(data, function(item) {
				movies.push(item);
			});
			return movies;
		});
	}

});
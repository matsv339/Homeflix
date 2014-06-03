angular.module('navigationModule').controller('NavbarController', function($scope, $location, Movies) {
	
	//Highlights current navigation
	$scope.isActive = function (viewLocation) { 
        return viewLocation === $location.path();
    };

    //When you click on a movie in the search field
    $scope.onSelect = function($item, $model, $label) {
        $location.path("/movies/" + $model.imdb_id);
    };

    //Returns the array based on the search key
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

	$scope.items = [
	    'Sign out'
	];

	//Toggles the drop down for the user
	$scope.toggleDropdown = function($event) {
	    $scope.status.isopen = !$scope.status.isopen;
	};

	$scope.help = {content: "Search for titles, actors etc.", title: "Guide"};

});
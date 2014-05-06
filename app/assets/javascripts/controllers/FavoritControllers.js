var favoritControllers = angular.module('favoritControllers', []);

// favoritControllers.config(function($http, $cookies) {
	
// });

favoritControllers.config(["$httpProvider", function(provider) {
  // provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]);

favoritControllers.controller('FavoritController', function($scope, $http, Favorits) {
	
	

 //    $http({method: 'GET', url: 'www.google.com/someapi', });

    $scope.stra = "hahahha";
    $scope.addFavorit = function() {

    	var url = '/favorits';
		var params = {user: 1, movie: $scope.movie.imdbID};

		$http.get('http://www.omdbapi.com/?i=' + $scope.movieID).success(function(data) {
        	$scope.movie = data;    
        	$scope.rating = new Array(Math.round($scope.movie.imdbRating/2));
    	});

		

		Favorits.create({user_id: 1});
		// $http.post('favorits.json').success(function(data) {
		// 	console.log("yeye");
		// }).error(function(data) {
		// 	console.log("nej");
		// });
    	// $http({
    	//     method: 'POST',
    	//     url: url,
    	//     data: params,
    	//     headers: {'Content-Type': 'application/json'}
    	// });

    	// $http.post('/users', params).success(function(data) {
    	// 	console.log("jfjff");
    	// });
      //   $http({
      //   	method: "POST", 
      //   	url: "/users",
   			// headers: {'Content-Type': 'application/json'}
      //   }).
      //   success(function(data, status, headers, config) {
      //       console.log(data);
      //   }); 
    };
});

// cafetownsend-angular-rails.herokuapp.com
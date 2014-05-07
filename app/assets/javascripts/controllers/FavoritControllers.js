var favoritControllers = angular.module('favoritControllers', []);

// favoritControllers.config(function($http, $cookies) {
	
// });

// favoritControllers.config(["$httpProvider", function(provider) {
//   // provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
// }]);

favoritControllers.controller('FavoritController', function($scope, $http, $routeParams, Favorits, IMDB) {
    
    $scope.movieID = $routeParams.movieID;
    $scope.imdbID = $routeParams.imdbID;
    console.log('id=' + $scope.movieID);
    console.log('imdb=' + $scope.imdbID);

    $scope.addFavorit = function() {
        var url = '/favorits';
		var params = {user: 1, movie: $scope.movie.imdbID};

        //Add the movie to favorits
        $http.post('/favorits', params).success(function(data) {
            console.log(data);
        });
    

		

		
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
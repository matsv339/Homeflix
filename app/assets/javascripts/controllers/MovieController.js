var movieControllers = angular.module('movieControllers', []);

Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};

movieControllers.controller('MovieController', function($scope, $http) {

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

movieControllers.controller('MovieDetailedController', function($scope, $routeParams, $http) {
    $scope.movieID = $routeParams.movieID;
    $http.get('http://www.omdbapi.com/?i=' + $scope.movieID).success(function(data) {
        $scope.movie = data;
    });
});


movieControllers.controller('PlayerController', function($scope, $http, $routeParams, $location) {
    $scope.moviePath = "assets/" + $routeParams.movieID + ".mp4";
    
    // //Checks if the video exsists
    // $http.get($scope.moviePath).success(function(data) {

            
    // }).error(function() {
    //     player.poster('assets/error_poster.jpg');
    //     console.log("neh");
    // });

    //Initialises the player
    videojs("player", {}, function() {
        
    });
    
    //Apply the src to the video
    videojs("player").ready(function() {     
        player = this;
        player.pause();
        player.src($scope.moviePath);    
        player.play();
    });
        
        
    
    //Routes back to the spesific movie page when the movie finish.
    player.on("ended", function() {
        $location.path('/movies/' + $routeParams.movieID);
        $scope.$apply();
    });
});
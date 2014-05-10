angular.module('homeModule').controller('HomeController', function($scope, LastMovies, IMDB) {
	LastMovies.index(function(data) {
		$scope.movies = [];
        for(var i = 0;i < data.length; i++) {
            IMDB.index({i: data[i].imdb_id}, function(data) {
                $scope.movies.push(data);
            });
        }
	});
	$scope.sliderInterval = 5000;
  	$scope.slides = [];
  	$scope.slides.push({
      image: "http://ia.media-imdb.com/images/M/MV5BODU4MjU4NjIwNl5BMl5BanBnXkFtZTgwMDU2MjEyMDE@._V1_SX300.jpg",
      text: "Hej hej hej"
    });
    $scope.slides.push({
      image: "http://ia.media-imdb.com/images/M/MV5BODU4MjU4NjIwNl5BMl5BanBnXkFtZTgwMDU2MjEyMDE@._V1_SX300.jpg",
      text: "Hej hej hej"
    });
    $scope.slides.push({
      image: "http://ia.media-imdb.com/images/M/MV5BODU4MjU4NjIwNl5BMl5BanBnXkFtZTgwMDU2MjEyMDE@._V1_SX300.jpg",
      text: "Hej hej hej"
    });
    console.log($scope.slides);
  	
});
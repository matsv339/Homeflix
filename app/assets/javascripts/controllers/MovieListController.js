angular.module('movieModule').controller('MovieListController', function($scope, Movies, IMDB, Genre) {
    $scope.genre = ["Action", 
                    "Crime", 
                    "Drama", 
                    "Comedy", 
                    "Western", 
                    "Adventure", 
                    "Fantasy", 
                    "Sci-Fi", 
                    "Romance", 
                    "Animation", 
                    "Thriller", 
                    "History", 
                    "Biography", 
                    "Documentary",
                    "Family",
                    "Film-Noir",
                    "Horror",
                    "Music",
                    "Musical",
                    "Mystery",
                    "Short",
                    "Sport",
                    "War"];

    $scope.createGenre = function(genres, genre) {
        
        // console.log("Genre: " + value);
        Genre.genre({genre: genre}, function(data) {
            console.log(genre);
            console.log(data);
            $scope.genres.push({genre: genre, data: data, lenght: data.lenght});

            // console.log($scope.  movies);
        });
    }

    angular.forEach($scope.genre, function(value) {
        $scope.genres = new Array;
        $scope.createGenre($scope.genres, value);
        
    });

    
    //Old way
	// $scope.movies = Movies.index();
});
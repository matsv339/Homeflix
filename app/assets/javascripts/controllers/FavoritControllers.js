var favoritControllers = angular.module('favoritControllers', []);

favoritControllers.controller('FavoritController', function($scope, $rootScope, $http, $routeParams, Favorits) {
    
    $scope.imdb_id = $routeParams.imdb_id;
    $http.get("/favorits/" + $rootScope.current_user + "/" + $scope.imdb_id + ".json").success(function(data) {
        console.log(data);
        if (data == "null") {
            $scope.favorit_text = "Add to favorits";
            $scope.is_favorit = false;
        }
        else {
            $scope.favorit_text = "Remove from favorits";
            $scope.is_favorit = true;
        }
    });
    $scope.addFavorit = function() {
        var params = {user_id: 1, imdb_id: $scope.imdb_id};
        if ($scope.is_favorit) {
            $http.delete("/favorits/" + $rootScope.current_user + "/" + $scope.imdb_id).success(function(data) {

            });
            // Favorits.destroy(params);
        }
        else if (!$scope.is_favorit) {}; {
            //Add the movie to favorits
            Favorits.create(params);    
        }
		
    };
});
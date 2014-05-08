angular.module('favoritModule').controller('FavoritController', function($scope, $rootScope, $http, $routeParams, Favorits) {
    //Add imdb_id to scope
    $scope.imdb_id = $routeParams.imdb_id;
    
    //Helper function to check if movie is in favorit
    $scope.in_favorits = function(imdb_id, object) {
        for(var i in object) {
            if(object[i].imdb_id == imdb_id) {
                return true;
             }
        }
    };

    // Check if movie is favorit
    Favorits.index({user_id: $rootScope.current_user}, function(data) {
        if ($scope.in_favorits($scope.imdb_id, data)) {
            $scope.is_favorit = true;
            $scope.favorit_text = "Remove from favorits";
        }
        else {
            $scope.is_favorit = false;
            $scope.favorit_text = "Add to favorits";
        }
    });
    
    $scope.updateFavorits = function() { 
        if ($scope.is_favorit) {
            Favorits.destroy({user_id: $rootScope.current_user, imdb_id: $scope.imdb_id}, function(data) {
                $scope.is_favorit = false;
                $scope.favorit_text = "Add to favorits";
            });
        }
        else if (!$scope.is_favorit) {
            Favorits.create({user_id: $rootScope.current_user, imdb_id: $scope.imdb_id}, function(data) {
                $scope.is_favorit = true;
                $scope.favorit_text = "Remove from favorits";
            });    
        }
    };
});
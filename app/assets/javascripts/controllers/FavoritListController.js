angular.module('movieModule').controller('FavoritListController', function($scope, $rootScope, $http, $routeParams, Favorits) {

    //Fetches the favorit movies for current user
    $scope.favorits = Favorits.index({user_id: $rootScope.current_user.id})
    
    //removes a favorit from the users favorits when in the list
    $scope.removeFavorit = function(imdb_id, idx) { 
        //Known bug when ng-repeat in favorits.html is order by the idx is wrong.
        Favorits.destroy({user_id: $rootScope.current_user.id, imdb_id: imdb_id}, function(data) {
            $scope.favorits.splice(idx, 1);
        });
    };
});
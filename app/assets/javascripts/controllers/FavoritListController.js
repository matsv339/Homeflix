angular.module('favoritModule').controller('FavoritListController', function($scope, $rootScope, $http, $routeParams, Favorits, IMDB) {

    // Check if movie is favorit and add all data to favorits
    Favorits.index({user_id: $rootScope.uid}, function(data) {
        //Add to favorits
        $scope.favorits = [];
        for(var i = 0;i < data.length; i++) {
            IMDB.index({i: data[i].imdb_id}, function(data) {
                $scope.favorits.push(data);
            });
        }
    });
    
    $scope.removeFavorit = function(imdb_id, idx) { 
        // console.log("id="+ imdb_id);
        // console.log("index="+idx);
        // console.log($scope.favorits[idx]);
        //Known bug when ng-repeat in favorits.html is order by the idx is wrong.
        Favorits.destroy({user_id: $rootScope.uid, imdb_id: imdb_id}, function(data) {
            $scope.favorits.splice(idx, 1);
        });
    };
});
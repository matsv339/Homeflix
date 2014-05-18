angular.module('newsModule').controller('NewsController', function($scope, $http, $rootScope, News, $sce) {

	$scope.cool = 1;

	News.fetch({q: 'http://feeds.feedburner.com/thr/film', num: 10}, {}, function (data) {
                        $scope.feed = data.responseData.feed;
                        $scope.entries = data.responseData.feed.entries;
               			
                        


                    });	

	$scope.kbk = function(element){
		// console.log(element);
		return $sce.trustAsHtml(element)
	};

});


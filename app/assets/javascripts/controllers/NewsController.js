angular.module('newsModule').controller('NewsController', function($scope, $http, $rootScope, News, $sce) {

	News.fetch({q: 'http://www.hollywoodreporter.com/taxonomy/term/59/0/feed', num: 10}, {}, function (data) {
                        $scope.feed = data.responseData.feed;
                        $scope.entries = data.responseData.feed.entries;
               			
                        


                    });	

	$scope.kbk = function(element){
			console.log(element);
		return $sce.trustAsHtml(element);

	};




});


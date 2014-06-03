angular.module('newsModule').controller('NewsController', function($scope, $http, $rootScope, News, $sce) {

	//Fetches the news feed
	News.fetch({q: 'http://www.hollywoodreporter.com/taxonomy/term/59/0/feed', num: 10}, {}, function (data) {
        $scope.feed = data.responseData.feed;
        $scope.entries = data.responseData.feed.entries;
    });	

	//converst the json to html
	$scope.printNews = function(element){
		return $sce.trustAsHtml(element);

	};




});


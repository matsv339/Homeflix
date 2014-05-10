angular.module('commentModule').controller('CommentController', function($scope, Comments, $http, $routeParams, $rootScope) {
	$scope.imdb_id = $routeParams.imdb_id;
	$scope.comments = Comments.index({imdb_id: $scope.imdb_id});
	$scope.isCollapsed = true;
	$scope.limit = 3;
	$scope.comment = function() {
		console.log($scope.content);
		Comments.create({imdb_id: $scope.imdb_id, user_id: $rootScope.current_user, content: $scope.content}, function(data) {
			$scope.comments.push()
			console.log("Comment created");
			$scope.content = "";
			$scope.comments = Comments.index({imdb_id: $scope.imdb_id});
		});
	}
});
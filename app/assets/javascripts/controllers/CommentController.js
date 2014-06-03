angular.module('movieModule').controller('CommentController', function($scope, Comments, $http, $filter, $routeParams, $rootScope) {
	
	$scope.imdb_id = $routeParams.imdb_id;
	$scope.comments = Comments.index({imdb_id: $scope.imdb_id});
	$scope.isCollapsed = true;
	$scope.limit = 5;

	//Creates a comment in the database
	$scope.comment = function() {
		Comments.create({imdb_id: $scope.imdb_id, user_id: $rootScope.current_user.id, content: $scope.content}, function(data) {
			$scope.comments.push()
			$scope.content = "";
			$scope.comments = Comments.index({imdb_id: $scope.imdb_id});
		});
	}
	
	//Valuates the keyup event and creates a comment on 13(enter).
	$scope.submit = function($event) {
		if ($event.keyCode == 13) {
			$scope.comment();
		};
		
	}
	//Returns how long time ago a datetime is
	$scope.formatTime = function(datetime) {
		format = "yyyy-MM-dd";
		then = new Date(datetime).getTime();
		today = new Date().getTime();
		minutes_ago = Math.round((today - then) / 60000);
		hours_ago = Math.floor(minutes_ago / 60);
		days_ago = Math.floor(hours_ago / 24);
		if (minutes_ago <= 1) {return "Now";} else
		if (minutes_ago < 60) {return minutes_ago + " minutes ago.";} else
		if (hours_ago == 1) {return hours_ago + " hour ago.";} else
		if (hours_ago < 24) {return hours_ago + " hours ago";} else
		if (days_ago == 1) {return days_ago + " day ago."} else
		if (days_ago < 1) {return "Yesterday";} else
		if (days_ago <= 3) {return days_ago + " days ago.";} else
			{return $filter('date')((then), format);}
	}
});
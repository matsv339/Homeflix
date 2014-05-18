angular.module('homeflix').controller('MainController', function($scope, $http, $rootScope, Sessions, $sce) {
	var token = $("meta[name='csrf-token']").attr("content");
	$http.defaults.headers.post['X-CSRF-Token'] = token;
	$http.defaults.headers.put['X-CSRF-Token'] = token;

	Sessions.show(function(data) {
		current_user = data;
		delete current_user.oauth_token;
		delete current_user.oauth_expires_at;
		delete current_user.provider;
 		$rootScope.current_user = current_user;
 	});
});


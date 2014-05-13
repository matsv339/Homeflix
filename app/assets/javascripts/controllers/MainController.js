angular.module('homeflix').controller('MainController', function($scope, $http, $rootScope, Sessions, $sce) {
	var token = $("meta[name='csrf-token']").attr("content");
	$http.defaults.headers.post['X-CSRF-Token'] = token;
	$http.defaults.headers.put['X-CSRF-Token'] = token;

	Sessions.show(function(data) {
 		$rootScope.current_user = data;
 	});
});


angular.module('homeflix').controller('MainController', function($http, $rootScope) {
	var token = $("meta[name='csrf-token']").attr("content");
	$http.defaults.headers.post['X-CSRF-Token'] = token;
	$http.defaults.headers.put['X-CSRF-Token'] = token;
	$rootScope.current_user = 1;
});
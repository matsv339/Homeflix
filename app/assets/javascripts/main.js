homeflix = angular.module('homeflix', [
	'loginControllers',
	'userControllers'
]);

// homeflix.config(['$routeProvider', function($routeProvider) {
// 	$routeProvider.
// 		when('/user', {
// 			templateUrl: '..assets/user.html', contoroller: 'UserController'
// 		}).
// 		otherwise({
// 			redirectTo: '..assets/user.html'
// 		});
// 	}
// ]);
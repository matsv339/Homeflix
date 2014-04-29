homeflix = angular.module('homeflix', [
	'ngRoute',
	'loginControllers',
	'userControllers'
]);

homeflix.config(['$routeProvider',
  	function($routeProvider) {
	    $routeProvider.
	      	when('/users', {
	        	templateUrl: 'assets/users.html',
	        	controller: 'UserController'
	      	}).
	      	when('/test', {
	        	templateUrl: 'assets/test.html',
	        	controller: 'LoginController'
	      	}).
	      	otherwise({
	        	redirectTo: '/'
	      	});
  }]);
homeflix = angular.module('homeflix', [
	'ngRoute',
	'loginControllers',
	'userControllers',
	'movieController'
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
	      	when('/movies', {
	        	templateUrl: 'assets/movies.html',
	        	controller: 'MovieController'
	      	}).
	      	otherwise({
	        	redirectTo: '/'
	      	});
  }]);
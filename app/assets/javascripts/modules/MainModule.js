homeflix = angular.module('homeflix', [
	'ngRoute',
	'loginControllers',
	'userControllers',
	'movieControllers',
	'navbarControllers'
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
	        	templateUrl: 'assets/movie-list.html',
	        	controller: 'MovieController'
	      	}).
	      	when('/movies/:movieID', {
	        	templateUrl: 'assets/movie-detail.html',
	        	controller: 'MovieDetailedController'
	      	}).
	      	when('/player/:movieID', {
	        	templateUrl: 'assets/player.html',
	        	controller: 'PlayerController'
	      	}).
	      	otherwise({
	        	redirectTo: '/'
	      	});
  }]);
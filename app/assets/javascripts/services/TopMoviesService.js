angular.module('serviceModule').service('TopMovies', function($resource) {
	return $resource('/top_ratings.json', {}, {'top_ratings': { method: 'GET', isArray: true}});
});
angular.module('serviceModule').service('LastMovies', function($resource) {
	return $resource('/movies/last.json', {}, {'index': { method: 'GET', isArray: true}});
});
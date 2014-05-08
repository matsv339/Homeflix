angular.module('serviceModule').service('Movies', function($resource) {
	return $resource('/movies.json', {}, {'index': { method: 'GET', isArray: true}});
});
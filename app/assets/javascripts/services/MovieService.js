angular.module('serviceModule').service('Movies', function($resource) {
	return $resource('/movies/:key.json', {}, {	'index': { method: 'GET', cache: true, isArray: true},
												'search': {method: 'GET', isArray: true, params: {key: '@key'}}});
});
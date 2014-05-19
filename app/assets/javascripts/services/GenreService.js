angular.module('serviceModule').service('Genre', function($resource) {
	return $resource('/genres.json', {}, {'genres': { method: 'GET', cache: true, isArray: true}});
});
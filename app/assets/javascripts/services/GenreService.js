angular.module('serviceModule').service('Genre', function($resource) {
	return $resource('/movies/genre/:genre.json', {}, {'genre': { method: 'GET', cache: true, isArray: true}});
});
angular.module('serviceModule').service('Users', function($resource) {
	return $resource('/users.json', {}, {'index': { method: 'GET', isArray: true}});
});
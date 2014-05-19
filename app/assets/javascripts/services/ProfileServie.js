angular.module('serviceModule').service('Profile', function($resource) {
	return $resource('/profile/last_watched.json', {}, {'last_watched': { method: 'GET', isArray: true}});
});

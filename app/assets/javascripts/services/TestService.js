angular.module('serviceModule').service('Test', function($resource) {
	return $resource('https://www.googleapis.com/userinfo/email?alt=json', {}, {'email': { method: 'GET'}});
});
angular.module('serviceModule').service('IMDB', function($resource) {
	return $resource('http://www.omdbapi.com', {}, {'index': { method: 'GET'}});
});
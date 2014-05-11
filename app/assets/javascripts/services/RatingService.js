angular.module('serviceModule').service('Ratings', function($resource) {
	return $resource('/ratings/:imdb_id/:user_id.json', {user_id: '@user_id', imdb_id: '@imdb_id'},
		{	'index' : {method: 'GET'},
			'create' : { method: 'POST'},
			'show' : {method: 'GET'},
			'update' : {method: 'PUT'}});
});
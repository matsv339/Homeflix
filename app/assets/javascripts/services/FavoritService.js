angular.module('serviceModule').service('Favorits', function($resource) {
	return $resource('/favorits/:user_id/:imdb_id.json', {user_id: '@user_id', imdb_id: '@imdb_id'},
		{	'index' : {method: 'GET', isArray: true},
			'create' : { method: 'POST'},
			'destroy' : {method: 'DELETE', headers: {'X-CSRF-Token': $("meta[name='csrf-token']").attr("content")}},
			'show' : {method: 'GET', isArray: true}});
});
angular.module('serviceModule').service('Progresses', function($resource) {
	return $resource('/progresses/:imdb_id/:user_id.json', {user_id: '@user_id', imdb_id: '@imdb_id'},
		{	'show' : {method: 'GET'},
			'create' : { method: 'POST'},
			'update' : {method: 'PUT'},
			'destroy' : {method: 'DELETE', headers: {'X-CSRF-Token': $("meta[name='csrf-token']").attr("content")}}});
});
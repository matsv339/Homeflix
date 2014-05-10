angular.module('serviceModule').service('Comments', function($resource) {
	return $resource('/comment/:imdb_id/:user_id/:comment_id.json', {},
		{	'index' : {method: 'GET', isArray: true, params: {imdb_id: '@imdb_id'}},
			'create' : { method: 'POST', params: {imdb_id: '@imdb_id', user_id: '@user_id'}},
			'destroy' : {method: 'DELETE', headers: {'X-CSRF-Token': $("meta[name='csrf-token']").attr("content")}}});
});
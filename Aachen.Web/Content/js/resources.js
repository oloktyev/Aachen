'use strict';

angular.module('aachen.Api', ['ngResource'])
  .factory('Api', function ($resource) {

      var Api = $resource(
          '/api/:content/:action',
          [],
          {
              getNew: { method: 'GET', isArray: true, params: { content: 'resource', action: 'getNew', first: '@first', count: '@count' } },
              getTopRated: { method: 'GET', isArray: true, params: { content: 'resource', action: 'getTopRated', first: '@first', count: '@count' } },
              updateRating: { method: 'POST', params: { content: 'resource', action: 'postRating', jokeId: '@jokeId', value: '@value' } },
          }
      );
      return Api;
  });
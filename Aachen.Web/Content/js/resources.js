'use strict';

angular.module('aachen.Api', ['ngResource'])
  .factory('Api', function ($resource) {

      var Api = $resource(
          '/api/:content/:action',
          [],
          {
              getNew: { method: 'GET', isArray: true, params: { content: 'resource', action: 'new', first: '@first', count: '@count' } },
              updateRating: { method: 'POST', params: { content: 'resource', action: 'rating', jokeId: '@jokeId', value: '@value' } },
          }
      );
      return Api;
  });
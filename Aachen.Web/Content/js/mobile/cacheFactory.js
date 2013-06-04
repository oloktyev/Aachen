'use strict';

angular.module('aachen.CacheFactory', ['ngResource']).factory('CacheFactory', function ($cacheFactory) {
    return $cacheFactory('cacheFactory');
});
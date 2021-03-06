﻿var aachen = {};
aachen.app = angular.module("aachen.app", ['ngResource', 'ngSanitize', 'aachen.Api', 'aachen.Storage', 'aachen.CacheFactory']);

aachen.app.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {

    var partialsDir = 'content/partials/';

    $locationProvider.html5Mode(true).hashPrefix('!');

    $routeProvider
        .when('/', { templateUrl: partialsDir + 'new.html' })
        .when('/mobile', { templateUrl: partialsDir + 'mobile-new.html' })
        .when('/toprated', { templateUrl: partialsDir + 'toprated.html' })
        .when('/featured', { templateUrl: partialsDir + 'featured.html', controller: aachen.baseCtrl })
        .when('/categories', { templateUrl: partialsDir + 'categories.html' })
        .when('/bycategory/:id', { templateUrl: '../' + partialsDir + 'by-category.html' })
        .when('/add', { templateUrl: partialsDir + 'add.html' })
        .otherwise({ redirectTo: '/' });
} ]);


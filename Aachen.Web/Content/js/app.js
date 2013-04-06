var aachen = {};
aachen.app = angular.module("aachen.app", ['ngResource', 'ngSanitize']);

aachen.app.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {

    var partialsDir = 'Content/partials/';
    
    //$locationProvider.hashPrefix('!');
    //$locationProvider.html5Mode(true);
    
    $routeProvider
        .when('/', { templateUrl: partialsDir + 'new.html', controller: aachen.baseCtrl })
        .when('/featured', { templateUrl: partialsDir + 'featured.html', controller: aachen.baseCtrl })
        .when('/categories', { templateUrl: partialsDir + 'categories.html' })
        .when('/toprated', { templateUrl: partialsDir + 'toprated.html' })
        .when('/add', { templateUrl: partialsDir + 'add.html' })
        .otherwise({ redirectTo: '/' });
}]);


var AachenApp = angular.module("AachenApp", ['ngResource', 'ngSanitize']);

// Define Controller constructor.
function Controller($scope, $resource) {
    var self = this;
    this.scope = $scope;
    this.itemsPerPage = 20;
    this.Resources = {
        Recent: $resource('/Jokes/GetRecent', { first: '@first', count: '@count' })
    };
        
    $scope.items = [];
    $scope.LoadMore = function() {
        var items = self.Resources.Recent.query({ first: self.scope.items.length, count: self.itemsPerPage }, function() {
            self.scope.items = self.scope.items.concat(items);
        });
    };

    $scope.LoadMore();
    
    return (this);
}

AachenApp.controller("RecentJokesController", Controller);
 
AachenApp.directive('ngScroll', function () {
    return function ($scope, element, attributes) {
        $(window).bind('scroll', function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
                $scope.$apply(attributes.ngScroll);
            }
        });
    };
});

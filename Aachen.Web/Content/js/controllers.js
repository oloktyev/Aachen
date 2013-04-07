aachen.baseCtrl = function($scope, $resource) {
    var self = this;
    this.scope = $scope;
    this.itemsPerPage = 20;
    this.Resources = {
        Recent: $resource('api/Resource/New', { first: '@first', count: '@count' })
    };

    $scope.items = [];
    $scope.container = $('.thumbnails');

    $scope.$on('$viewContentLoaded', function () {
        $scope.container.masonry();
    });

    $scope.alignContent = function () {
        $scope.container.masonry('reload');
    };

    $scope.loadMore = function() {
        var items = self.Resources.Recent.query({ first: self.scope.items.length, count: self.itemsPerPage }, function() {
            self.scope.items = self.scope.items.concat(items);
        });
    };

    $scope.loadMore();
};

aachen.app.controller("NewController", aachen.baseCtrl);
aachen.app.controller("FeaturedController", aachen.baseCtrl);

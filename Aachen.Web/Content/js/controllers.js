aachen.baseCtrl = function ($scope, $resource, Api, Storage) {
    var self = this;
    this.scope = $scope;
    this.itemsPerPage = 20;

    $scope.items = [];
    $scope.container = $('.thumbnails');

    $scope.$on('$viewContentLoaded', function () {
        $scope.container.masonry();
    });

    $scope.alignContent = function () {
        $scope.container.masonry('reload');
    };

    $scope.loadMore = function() {
        var items = Api.getNew({ first: self.scope.items.length, count: self.itemsPerPage }, function () {
            self.scope.items = self.scope.items.concat(items);
        });
    };
    
    $scope.updateRating = function (item, value) {
        if (!Storage.contains(item.Id)) {
            item.Rating = item.Rating + value;
            Storage.put(item.Id);
            Api.updateRating({ jokeId: item.Id, value: value });
        }
    };

    $scope.loadMore();
};

aachen.app.controller("NewController", aachen.baseCtrl);
aachen.app.controller("FeaturedController", aachen.baseCtrl);

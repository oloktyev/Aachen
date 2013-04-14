aachen.config = {
    itemsPerPage: 20
};

aachen.controllers = aachen.controllers || {};

aachen.controllers.base = function ($scope, $location) {
    $scope.activePath = null;
    
    $scope.$on('$routeChangeSuccess', function () {
        $scope.activePath = $location.path();
    });
};

aachen.controllers.content = function ($scope, Api, Storage, Masonry) {
    Masonry.init();

    $scope.alignContent = Masonry.alignContent;

    $scope.updateRating = function (item, value) {
        if (!Storage.contains(item.Id)) {
            item.Rating = item.Rating + value;
            Storage.put(item.Id);
            Api.updateRating({ jokeId: item.Id, value: value });
        }
    };
};

aachen.controllers.new = function ($scope, Api) {
    $scope.items = [];
    
    $scope.loadMore = function () {
        var items = Api.getNew({ first: $scope.items.length, count: aachen.config.itemsPerPage }, function () {
            $scope.items = $scope.items.concat(items);
        });
    };
    
    $scope.loadMore();
};

aachen.controllers.topRated = function ($scope, $resource, Api) {
    $scope.items = [];

    $scope.loadMore = function () {
        var items = Api.getTopRated({ first: $scope.items.length, count: aachen.config.itemsPerPage }, function () {
            $scope.items = $scope.items.concat(items);
        });
    };

    $scope.loadMore();
};

aachen.app.controller("BaseController", aachen.controllers.base);
aachen.app.controller("ContentController", aachen.controllers.content);
aachen.app.controller("NewController", aachen.controllers.new);
aachen.app.controller("FeaturedController", aachen.controllers.content);
aachen.app.controller("TopRatedController", aachen.controllers.topRated);

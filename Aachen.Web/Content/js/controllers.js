aachen.config = {
    itemsPerPage: 20
};

aachen.controls = {
    loading: $('#aachen-loading')
}

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
        if (!Storage.rating.contains(item.Id)) {
            item.Rating = item.Rating + value;
            Storage.rating.put(item.Id);
            Api.updateRating({ jokeId: item.Id, value: value });
        }
    };
    
    $scope.starContent = function (item) {
        if (!Storage.star.contains(item.Id))
            Storage.star.put(item.Id);
    };
};

aachen.controllers.new = function ($scope, Api) {
    $scope.items = [];
    
    $scope.loadMore = function () {
        aachen.controls.loading.show();
        var items = Api.getNew({ first: $scope.items.length, count: aachen.config.itemsPerPage }, function () {
            if (items.First === $scope.items.length)
                $scope.items = $scope.items.concat(items.JokeList);
            aachen.controls.loading.hide();
        });
    };
    
    $scope.loadMore();
};

aachen.controllers.topRated = function ($scope, $resource, Api) {
    $scope.items = [];

    $scope.loadMore = function () {
        aachen.controls.loading.show();
        var items = Api.getTopRated({ first: $scope.items.length, count: aachen.config.itemsPerPage }, function () {
            if (items.First === $scope.items.length)
                $scope.items = $scope.items.concat(items.JokeList);
            aachen.controls.loading.hide();
        });
    };

    $scope.loadMore();
};

aachen.controllers.featured = function ($scope, $resource, Api, Storage) {
    $scope.items = [];

    $scope.loadMore = function () {
        aachen.controls.loading.show();
        var items = Api.getFeatured({ jokes: Storage.star.get(), first: $scope.items.length }, function () {
            if (items.First === $scope.items.length)
                $scope.items = $scope.items.concat(items.JokeList);
            aachen.controls.loading.hide();
        });
    };

    $scope.loadMore();
};

aachen.app.controller("BaseController", aachen.controllers.base);
aachen.app.controller("ContentController", aachen.controllers.content);
aachen.app.controller("NewController", aachen.controllers.new);
aachen.app.controller("FeaturedController", aachen.controllers.featured);
aachen.app.controller("TopRatedController", aachen.controllers.topRated);

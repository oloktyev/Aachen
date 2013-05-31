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
    $scope.featured = Storage.star.get();

    $scope.updateRating = function (item, value) {
        if (!Storage.rating.contains(item.Id)) {
            item.Rating = item.Rating + value;
            Storage.rating.put(item.Id);
            Api.updateRating({ jokeId: item.Id, value: value });
        }
    };
    
    $scope.addFeatured = function (item) {
        if (!Storage.star.contains(item.Id)) {
            Storage.star.put(item.Id);
            $scope.featured = Storage.star.get();
        }

    };
    
    $scope.removeFeatured = function (item) {
        if (Storage.star.contains(item.Id)) {
            Storage.star.deleteItem(item.Id);
            $scope.featured = Storage.star.get();
        }
    };
};

aachen.controllers.newContent = function ($scope, Api) {
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
        var jokeIds = Storage.star.get().slice($scope.items.length, aachen.config.itemsPerPage);
        if (jokeIds.length > 0) {
            aachen.controls.loading.show();
            var obj = { jokes: jokeIds, first: $scope.items.length };
            var items = Api.getFeatured(obj, function() {
                if (items.First === $scope.items.length)
                    $scope.items = $scope.items.concat(items.JokeList);
                aachen.controls.loading.hide();
            });
        }
    };

    $scope.loadMore();
};

aachen.app.controller("BaseController", aachen.controllers.base);
aachen.app.controller("ContentController", aachen.controllers.content);
aachen.app.controller("NewController", aachen.controllers.newContent);
aachen.app.controller("FeaturedController", aachen.controllers.featured);
aachen.app.controller("TopRatedController", aachen.controllers.topRated);

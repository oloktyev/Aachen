﻿aachen.config = {
    itemsPerPage: 20
};

aachen.controls = {
    loading: $('#aachen-loading'),
    topMenu: $('.aachen-top-menu')
};

aachen.controllers = aachen.controllers || {};

aachen.controllers.base = function ($scope, $location) {
    $scope.activePath = null;

    $scope.$on('$routeChangeSuccess', function () {
        $scope.activePath = $location.path();
    });

    $scope.$on('$routeChangeStart', function () {
        aachen.controls.topMenu.collapse('hide');
    });

};
aachen.controllers.base.$inject = ['$scope', '$location'];

aachen.controllers.content = function ($scope, Api, Storage) {

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
aachen.controllers.content.$inject = ['$scope', 'Api', 'Storage'];

aachen.controllers.newContent = function ($scope, Api, CacheFactory) {
    $scope.items = [];

    $scope.loadMore = function () {
        var length = $scope.items.length;
        var cachedItems = CacheFactory.get('new');
        if (cachedItems && cachedItems.length > length) {
            var pageItems = cachedItems.slice(length, length + aachen.config.itemsPerPage);
            $scope.items = $scope.items.concat(pageItems);
        }
        else {
            aachen.controls.loading.show();
            var items = Api.getNew({ first: length, count: aachen.config.itemsPerPage }, function () {
                if (items.First === length) {
                    $scope.items = $scope.items.concat(items.JokeList);
                    CacheFactory.put('new', $scope.items);
                }
                aachen.controls.loading.hide();
            });
        }
    };

    $scope.loadMore();
};
aachen.controllers.newContent.$inject = ['$scope', 'Api', 'CacheFactory'];

aachen.controllers.topRated = function ($scope, $resource, Api, CacheFactory) {
    $scope.items = [];

    $scope.loadMore = function () {
        var length = $scope.items.length;
        var cachedItems = CacheFactory.get('topRated');
        if (cachedItems && cachedItems.length > length) {
            var pageItems = cachedItems.slice(length, length + aachen.config.itemsPerPage);
            $scope.items = $scope.items.concat(pageItems);
        }
        else {
            aachen.controls.loading.show();
            var items = Api.getTopRated({ first: $scope.items.length, count: aachen.config.itemsPerPage }, function () {
                if (items.First === $scope.items.length) {
                    $scope.items = $scope.items.concat(items.JokeList);
                    CacheFactory.put('topRated', $scope.items);
                }
                aachen.controls.loading.hide();
            });
        }
    };

    $scope.loadMore();
};
aachen.controllers.topRated.$inject = ['$scope', '$resource', 'Api', 'CacheFactory'];

aachen.controllers.featured = function ($scope, $resource, Api, Storage) {
    $scope.items = [];

    $scope.loadMore = function () {
        var jokeIds = Storage.star.get().slice($scope.items.length, aachen.config.itemsPerPage);

        if (jokeIds.length > 0) {
            aachen.controls.loading.show();
            var obj = { jokes: jokeIds, first: $scope.items.length };
            var items = Api.getFeatured(obj, function () {
                if (items.First === $scope.items.length) {
                    $scope.items = $scope.items.concat(items.JokeList);
                }
                aachen.controls.loading.hide();
            });
        }

    };

    $scope.loadMore();
};
aachen.controllers.featured.$inject = ['$scope', '$resource', 'Api', 'Storage'];

aachen.controllers.categories = function ($scope, $resource, Api, CacheFactory) {
    if (!$scope.categories) {
        var cachedItems = CacheFactory.get('categories');
        if (cachedItems && cachedItems.length > length) {
            $scope.categories = cachedItems;
        }
        else {
            aachen.controls.loading.show();
            var items = Api.getAllCategories(function () {
                $scope.categories = items;
                CacheFactory.put('categories', items);
                aachen.controls.loading.hide();
            });
        }
    }

};
aachen.controllers.categories.$inject = ['$scope', '$resource', 'Api', 'CacheFactory'];

aachen.controllers.byCategory = function ($scope, $routeParams, Api, CacheFactory) {
    $scope.items = [];

    $scope.loadMore = function () {
        var categoryId = $routeParams.id;
        var length = $scope.items.length;
        var cachedItems = CacheFactory.get('byCategory-' + categoryId);
        if (cachedItems && cachedItems.length > length) {
            var pageItems = cachedItems.slice(length, length + aachen.config.itemsPerPage);
            $scope.items = $scope.items.concat(pageItems);
        }
        else {
            aachen.controls.loading.show();
            var items = Api.getByCategory({ id: categoryId, first: $scope.items.length, count: aachen.config.itemsPerPage }, function () {
                if (items.First === $scope.items.length) {
                    $scope.items = $scope.items.concat(items.JokeList);
                    CacheFactory.put('byCategory-' + categoryId, $scope.items);
                }
                aachen.controls.loading.hide();
            });
        }
    };

    $scope.loadMore();
};
aachen.controllers.byCategory.$inject = ['$scope', '$routeParams', 'Api', 'CacheFactory'];

aachen.controllers.mobileNew = function ($scope, Api, CacheFactory) {
    $scope.items = [];
    $scope.cnt = 0;
    $scope.loadMore = function () {
        $scope.cnt += 1;
        if ($scope.cnt >= $scope.items.length) {
            var length = $scope.items.length;
            var cachedItems = CacheFactory.get('mobileNew');
            if (cachedItems && cachedItems.length > length) {
                var pageItems = cachedItems.slice(length, length + aachen.config.itemsPerPage);
                $scope.items = $scope.items.concat(pageItems);
            }
            else {
                aachen.controls.loading.show();
                var items = Api.getNew({ first: $scope.items.length, count: aachen.config.itemsPerPage }, function () {
                    if (items.First === $scope.items.length) {
                        $scope.items = $scope.items.concat(items.JokeList);
                        CacheFactory.put('mobileNew', $scope.items);
                    }
                    aachen.controls.loading.hide();
                });
            }
        }
    };

    $scope.loadMore();
};
aachen.controllers.mobileNew.$inject = ['$scope', 'Api', 'CacheFactory'];

aachen.app.controller("BaseController", aachen.controllers.base);
aachen.app.controller("ContentController", aachen.controllers.content);
aachen.app.controller("NewController", aachen.controllers.newContent);
aachen.app.controller("TopRatedController", aachen.controllers.topRated);
aachen.app.controller("FeaturedController", aachen.controllers.featured);
aachen.app.controller("CategoriesController", aachen.controllers.categories);
aachen.app.controller("ByCategoryController", aachen.controllers.byCategory);
aachen.app.controller("MobileController", aachen.controllers.mobileNew);

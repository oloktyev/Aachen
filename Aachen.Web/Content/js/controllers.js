aachen.baseCtrl = function($scope, $resource) {
    var self = this;
    this.scope = $scope;
    this.itemsPerPage = 20;
    this.Resources = {
        Recent: $resource('api/Resource/New', { first: '@first', count: '@count' })
    };

    $scope.items = [];

    $scope.alignContent = function () {
        $('.thumbnails').masonry({
            //itemSelector: '.aachen-joke',
            singleMode: false,
            //isResizable: true,
            isAnimated: true,
            animationOptions: {
                queue: false,
                duration: 500
            }
        });
        
        //$('.thumbnails').masonry('appended', $('.aachen-joke'));
    };

    $scope.loadMore = function() {
        var items = self.Resources.Recent.query({ first: self.scope.items.length, count: self.itemsPerPage }, function() {
            self.scope.items = self.scope.items.concat(items);
        });
    };

    $scope.loadMore();

    return (this);
};

aachen.app.controller("NewController", aachen.baseCtrl);
aachen.app.controller("FeaturedController", aachen.baseCtrl);

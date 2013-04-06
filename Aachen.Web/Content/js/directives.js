aachen.app.directive('ngRepeatFinished', function () {
    return function (scope, element, attributes) {
        if (scope.$last) {
            scope.$evalAsync(attributes.ngRepeatFinished);
        }
    };
});

aachen.app.directive('ngScroll', function () {
    return function ($scope, element, attributes) {
        $(window).bind('scroll', function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
                $scope.$apply(attributes.ngScroll);
            }
        });
    };
});
aachen.app.directive('ngRepeatFinished', function () {
    return function ($scope, element, attributes) {
    };
});

aachen.app.directive('ngScroll', function () {
    return function ($scope, element, attributes) {
        $(window).unbind('scroll');
        $(window).bind('scroll', function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
                $scope.$apply(attributes.ngScroll);
            }
        });
    };
});

aachen.app.directive('ngTap', function () {
    return function (scope, element, attrs) {
        element.on('touchstart', function () {
            scope.$apply(attrs.ngTap);
        });
    };
});
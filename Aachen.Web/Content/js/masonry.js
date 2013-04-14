'use strict';

angular.module('aachen.Masonry', [])
    .factory('Masonry', function () {
        var $container;

        return {
            init: function () {
                $container = $('.thumbnails');
                $container.masonry();
            },

		    alignContent: function () {
		        $container.imagesLoaded(function () {
		            $container.masonry('reload');
		        });
		        $container.masonry('reload');
		    }
        };
});
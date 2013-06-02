'use strict';

angular.module('aachen.Masonry', [])
    .service('Masonry', function () {
        var $container;// = $('.thumbnails');


        this.init = function() {
            $container = $('.thumbnails');
            $container.masonry();
        };

        this.alignContent = function() {
            $container.imagesLoaded(function() {
                $container.masonry('reload');
            });
            $container.masonry('reload');
        };

    });
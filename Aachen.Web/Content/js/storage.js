'use strict';

angular.module('aachen.Storage', ['ngResource'])
    .factory('Storage', function () {
        var RATING_STORAGE_ID = 'aachen-vote-storage',
            STAR_STORAGE_ID = 'aachen-star-storage';

        function getRatingItems() {
            return JSON.parse(localStorage.getItem(RATING_STORAGE_ID) || '[]');
        }
        
        function getStarItems() {
            return JSON.parse(localStorage.getItem(STAR_STORAGE_ID) || '[]');
        }

        return {
            rating: {
                get: getRatingItems,

                put: function(id) {
                    var items = getRatingItems();
                    items.push(id);
                    localStorage.setItem(RATING_STORAGE_ID, JSON.stringify(items));
                },

                contains: function(id) {
                    return getRatingItems().indexOf(id) >= 0;
                }
            },
            star: {
                get: getStarItems,

                put: function(id) {
                    var items = getStarItems();
                    items.push(id);
                    localStorage.setItem(STAR_STORAGE_ID, JSON.stringify(items));
                },
                
                deleteItem: function(id) {
                    var items = getStarItems();
                    for(var i = items.length - 1; i >= 0; i--) {
                        if(items[i] === id) {
                            items.splice(i, 1);
                        }
                    }
                    localStorage.setItem(STAR_STORAGE_ID, JSON.stringify(items));
                },

                contains: function(id) {
                    return getStarItems().indexOf(id) >= 0;
                }
            }
        };
});
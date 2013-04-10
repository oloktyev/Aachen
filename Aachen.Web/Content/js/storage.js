'use strict';

angular.module('aachen.Storage', ['ngResource'])
    .factory('Storage', function () {
        var STORAGE_ID = 'aachen-storage';

        function getItems() {
            return JSON.parse(localStorage.getItem(STORAGE_ID) || '[]');
        }

        return {
            get: getItems,

		    put: function (id) {
		        var items = getItems();
		        items.push(id);
			    localStorage.setItem(STORAGE_ID, JSON.stringify(items));
		    },
            
		    contains: function (id) {
		        return getItems().indexOf(id) >= 0;
		    }
        };
});
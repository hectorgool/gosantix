if (window.console) {
  console.log("Welcome to your Play application's JavaScript!");
}

var app = angular.module("myApp", ['ngResource', 'ngRoute']);


app.controller("ElasticSearchCtrl", function ($scope) {

	$scope.term = null;

	$scope.onKeyUp = function () {
      
      	//console.log('$event: ' + $event );      	
        var jsonTerm = {
        	query: {
            	term: {
              		"name.autocomplete": $("#term").val()
            	}
          	},
          	facets: {
            	name: {
              		terms: {
                		field: "name"
              		}
            	}
          	}
        };

        //http://stackoverflow.com/questions/1625208/print-content-of-javascript-object
		console.log('jsonTerm: ' + jsonTerm.toSource() );
        $scope.term = jsonTerm;

    };

});


/*
app.controller( 'ElasticSearchCtrl', ['$scope', 'PostFactory',function ( $scope, PostFactory, json ) {

	$scope.post = null;

	PostFactory.query( json, function( res ){
		$scope.post = res;
	});

}]);

app.factory('PostFactory', function ($resource) {
	return $resource('http://localhost:9000/term', {
		query: { method: 'GET', isArray: true }
	})
});
*/
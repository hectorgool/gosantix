if (window.console) {
  console.log("Welcome to your Play application's JavaScript!");
}

(function(){

  'use strict';

  var app, dependencies;

  dependencies = ['ngResource','ElasticSearchServices'];
  app = angular.module('myApp', dependencies);

  app.controller('ElasticSearchCtrl', 
    ['$scope',  'ElasticSearchQuery', '$location',
      function  ElasticSearchCtrl($scope, ElasticSearchQuery, $location) {


        $scope.onKeyUp = function()  {

          $scope.term = null;
          $scope.jsonResponse = null;

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

          console.log('jsonTerm: ' + jsonTerm.toSource() );
          $scope.term = jsonTerm;

          ElasticSearchQuery.save( {}, jsonTerm,
            function  success(response) {
              console.log("Success:"  + JSON.stringify(response));
              $scope.jsonResponse = response;
              $location.path('/');
            },
            function  error(errorResponse)  {
              console.log("Error:"  + JSON.stringify(errorResponse));
            }
          );

        };


      }
    ]
  );

})();



(function(){

  'use strict';

  var app, dependencies;

  dependencies = ['ngResource'];

  app = angular.module('ElasticSearchServices', dependencies);

  app.factory('ElasticSearchQuery', ['$resource',
    function($resource) {
      return  $resource("/term", {  }, {
        get:   {method:  'GET',  cache:  false,  isArray:  true},
        query: {method:  'POST', cache:  false,  isArray:  false}
      });
    }
  ]);

  app.factory('ElasticSearchPost', ['$resource',
    function($resource) {    
      return  $resource("/term", {}, {
        get:    {method: 'GET',    cache: false, isArray: false},
        save:   {method: 'POST',   cache: false, isArray: false},
        update: {method: 'PUT',    cache: false, isArray: false},
        delete: {method: 'DELETE', cache: false, isArray: false}
      });
    }
  ]);

})();


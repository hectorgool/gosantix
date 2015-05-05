/*
if (window.console) {
  console.log("Welcome to your Play application's JavaScript!");
}
*/

(function(){


  'use  strict';
  
  var app = angular.module( 'signupServices',  ['ngResource'] );

  app.factory('SignUpQuery', ['$resource', function( $resource ){

    return $resource("/auth/signup", {}, {
      get:    {method:  'GET',    cache:  false,  isArray:  false},
      save:   {method:  'POST',   cache:  false,  isArray:  false},
      update: {method:  'PUT',    cache:  false,  isArray:  false},
      delete: {method:  'DELETE', cache:  false,  isArray:  false}
    });

  }]);


})();
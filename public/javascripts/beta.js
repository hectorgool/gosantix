/*
if (window.console) {
  console.log("Welcome to your Play application's JavaScript!");
}
*/

(function(){

  'use strict';

  var app, dependencies;

  dependencies = ['ngResource', 'ngRoute','myApp.controller'];
  app = angular.module('myApp', dependencies);
  
  app.config( function( $routeProvider, $locationProvider ){   

    $routeProvider.when('/', {
      templateUrl: '/assets/partials/index.html',
      controller: 'ElasticSearchCtrl'
    });   


    $routeProvider.when('/signup', {
      templateUrl: '/assets/partials/signup.html'//,
      //controller: 'PostCtrl'
    });
    
    $routeProvider.when('/login', {
      templateUrl: '/assets/partials/login.html'//,
      //controller: 'PostCtrl'
    });
    
    $routeProvider.otherwise({
      redirectTo: '/'
    });
	

  }); 

})();

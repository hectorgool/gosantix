#do ->
  'use strict'
  app = undefined
  dependencies = undefined
  dependencies = [
    'ngResource'
    'ngRoute'
    'myApp.services'
    'myApp.controllers'
  ]
  app = angular.module('myApp', dependencies)
  app.config ($routeProvider) ->
    $routeProvider.when '/',
      templateUrl: 'partials/index.html'
    #  controller: 'ElasticSearchCtrl'
    $routeProvider.when '/signup', 
      templateUrl: 'partials/signup.html'
    $routeProvider.when '/login', 
      templateUrl: 'partials/login.html'      
    #$routeProvider.otherwise 
    #  templateUrl: 'partials/404.html'
    return
  #return  
do ->
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
    $routeProvider.when '/tmp1',
      templateUrl: 'partials/index.html'
      controller: 'AppController'
    $routeProvider.when '/tmp2',
      templateUrl: 'partials/index.html'
      controller: 'AppController'      
    #$routeProvider.otherwise templateUrl: 'app/partials/404.html'
    return
  return
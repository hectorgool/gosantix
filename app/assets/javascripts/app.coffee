'use strict'
app = undefined
dependencies = undefined
dependencies = [
  'ngResource'
  'ngRoute'
  'elasticsearch'
  'auth'
]
app = angular.module('myApp', dependencies)
app.config ($routeProvider, $locationProvider) ->
  $routeProvider.when '/',
    templateUrl: '/assets/partials/index.html'
    controller: 'ElasticSearchCtrl'
  $routeProvider.when '/signup', templateUrl: '/assets/partials/signup.html'
  $routeProvider.when '/login', templateUrl: '/assets/partials/login.html'
  $routeProvider.otherwise redirectTo: '/'
  return
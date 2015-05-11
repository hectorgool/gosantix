'use strict'

dependencies = [
  'ngRoute'
  'elasticsearch.controller'
  'auth'
]

app = angular.module('myApp', dependencies)

app.config ($routeProvider, $locationProvider) ->

  $routeProvider.when '/',
    templateUrl: '/assets/partials/index.html'
    controller: 'ElasticSearchCtrl'

  $routeProvider.when '/signup', 
    templateUrl: '/assets/partials/signup.html'

  $routeProvider.when '/login', 
    templateUrl: '/assets/partials/login.html'

  $routeProvider.when '/catalog', 
    templateUrl: '/assets/partials/catalog.html'

  $routeProvider.otherwise 
    redirectTo: '/'

  return
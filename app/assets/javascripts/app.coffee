'use strict'

dependencies = [
  'ngRoute'
  'elasticsearch.controller'
  'items.controller'
  'auth'
  'translate'
]

app = angular.module('SANTO', dependencies)

app.config ($routeProvider, $locationProvider) ->

  $routeProvider.when '/',
    templateUrl: '/assets/partials/index.html'
    controller: 'ElasticSearchCtrl'

  $routeProvider.when '/signup', 
    templateUrl: '/assets/partials/signup.html'

  $routeProvider.when '/login', 
    templateUrl: '/assets/partials/login.html'

  $routeProvider.when '/catalog/:catalog',
    templateUrl: '/assets/partials/catalog.html'

  $routeProvider.when '/catalog/:catalog/item/:item',
    templateUrl: '/assets/partials/catalog_item.html'

  $routeProvider.when '/items', 
    templateUrl: '/assets/partials/items.html'
    controller: 'ItemsController'

  $routeProvider.when '/create', 
    templateUrl: '/assets/partials/admin/items/create.html'
    controller: 'ItemController'

  $routeProvider.when '/admin/list', 
    templateUrl: '/assets/partials/admin/items/list.html'
    controller: 'ItemsController'

  $routeProvider.otherwise 
    redirectTo: '/'

  return
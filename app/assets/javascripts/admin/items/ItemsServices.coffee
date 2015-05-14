'use strict'

dependencies = [ 'ngResource' ]
app = angular.module('items.services', dependencies)

app.factory 'ItemsQuery', [
  '$resource'
  ($resource) ->
    $resource '/admin/items', {},
      get:
        method: 'GET'
        cache: false
        isArray: true
      query:
        method: 'POST'
        cache: false
        isArray: false
]

app.factory 'ItemsPost', [
  '$resource'
  ($resource) ->
    $resource '/admin/items', {},
      get:
        method: 'GET'
        cache: false
        isArray: true
      save:
        method: 'POST'
        cache: false
        isArray: false
      update:
        method: 'PUT'
        cache: false
        isArray: false
      delete:
        method: 'DELETE'
        cache: false
        isArray: false
]

'use strict'

dependencies = [ 'ngResource' ]
app = angular.module('items.services', dependencies)

app.factory 'ItemsQuery', [
  '$resource'
  ($resource) ->
    $resource '/admin/items', {},
      query:
        method: 'GET'
        cache: false
        isArray: true
]

#app.factory 'ItemsPost', [
app.factory 'ItemsCRUD', [
  '$resource'
  ($resource) ->
    $resource '/admin/item/:id', {},
      get:
        method: 'GET'
        cache: false
        isArray: false
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

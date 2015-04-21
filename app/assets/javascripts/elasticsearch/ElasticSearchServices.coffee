
'use strict'

app = undefined
dependencies = undefined

dependencies = [ 'ngResource' ]
app = angular.module('myApp.services', dependencies)

app.factory 'ElasticSearchQuery', [
  '$resource'
  ($resource) ->
    $resource '/term', {},
      get:
        method: 'GET'
        cache: false
        isArray: true
      query:
        method: 'POST'
        cache: false
        isArray: false
]

app.factory 'ElasticSearchPost', [
  '$resource'
  ($resource) ->
    $resource '/term', {},
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

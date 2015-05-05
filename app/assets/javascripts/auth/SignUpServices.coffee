
'use  strict'
app = angular.module('signupServices', [ 'ngResource' ])
app.factory 'SignUpQuery', [
  '$resource'
  ($resource) ->
    $resource '/auth/signup', {},
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
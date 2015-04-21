
'use strict'
app = undefined
dependencies = undefined
dependencies = [
  'ngResource'
  'myApp.services'
]
app = angular.module('myApp.controller', dependencies)
app.controller 'ElasticSearchCtrl', [
  '$scope'
  'ElasticSearchQuery'
  '$location'
  ($scope, ElasticSearchQuery, $location) ->

    $scope.onKeyUp = ->
      $scope.term = null
      $scope.jsonResponse = null
      jsonTerm = 
        query: term: 'name.autocomplete': $('#term').val()
        facets: name: terms: field: 'name'
      #console.log 'jsonTerm: ' + jsonTerm.toSource()
      $scope.term = jsonTerm
      ElasticSearchQuery.save {}, jsonTerm, ((response) ->
        console.log 'Success:' + JSON.stringify(response)
        $scope.jsonResponse = response
        #$location.path '/'
        return
      ), (errorResponse) ->
        console.log 'Error:' + JSON.stringify(errorResponse)
        return
      return

    return
]

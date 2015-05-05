
'use strict'

dependencies = [
  'ngResource'
  'myApp.services'
]

app = angular.module('elasticsearch', dependencies)

app.controller 'ElasticSearchCtrl', [
  '$scope'
  'ElasticSearchQuery'
  '$location'

  ($scope, ElasticSearchQuery, $location) ->

    $scope.onKeyUpSendTerm = ->

      $scope.jsonTerm = 
        query: term: 'name.autocomplete': $('#term').val()
        facets: name: terms: field: 'name'    

      ElasticSearchQuery.save {}, $scope.jsonTerm, ((response) ->
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

'use strict'

dependencies = [
  'items.services'
]

app = angular.module('items', dependencies)

app.controller 'ItemController', [
  '$scope'
  'ItemsPost'
  '$location'

  ($scope, ItemsPost, $location) ->

    $scope.addItem = ->

      $scope.jsonTerm = 
        query: term: 'name.autocomplete': $('#term').val()
        facets: name: terms: field: 'name'    

      ItemsPost.save {}, $scope.jsonTerm, ((response) ->
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

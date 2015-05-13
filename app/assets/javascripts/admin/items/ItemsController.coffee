'use strict'

dependencies = [
  'items.services'
  'slugifier'
]

app = angular.module('items.controller', dependencies)

app.controller 'ItemController', [
  '$scope'
  'ItemsPost'
  '$location'
  'Slug'

  ($scope, ItemsPost, $location, Slug) ->

    $scope.item =
      'name'       : $('#name').val()
      'description': $('#description').val()      

    $scope.addItem = ->
      console.log 'item: ' + JSON.stringify($scope.item)      
      ItemsPost.save {}, $scope.item, (
        (response) ->
          console.log 'Success:' + JSON.stringify(response)
          $scope.item = response
          $scope.item = {};
          return
      ),(errorResponse) ->
          console.log 'Error:' + JSON.stringify(errorResponse)
          return
      return

    return

]

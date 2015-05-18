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

    $scope.item = {}

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

app.controller 'ItemsController', [
  '$scope'
  'ItemsQuery'

  ($scope, ItemsQuery) ->

    $scope.itemList = []

    ItemsQuery.get {}, ((response) ->
      console.log 'Success:' + JSON.stringify(response)
      $scope.itemList = response
      return
    ), (errorResponse) ->
      console.log 'Error:' + JSON.stringify(errorResponse)
      return
    return
]

app.controller 'ItemViewController', [
  '$scope'
  '$routeParams'
  'ItemsPost'
  ($scope, $routeParams, ItemsPost) ->
    itemId = $routeParams.id
    #$scope.blg = 1
    console.log 'itemId: ' + itemId
    ItemsPost.get { id: itemId }, ((response) ->
      console.log 'Success:' + JSON.stringify(response)
      $scope.itemDocument = response
      return
    ), (errorResponse) ->
      console.log 'Error:' + JSON.stringify(errorResponse)
      return
    return
]

'use strict'


dependencies = [
  'items.services'
  'slugifier'
]


app = angular.module('items.controller', dependencies)

app.controller 'ItemsCreateController', [
  '$scope'
  'ItemsCRUD'
  '$location'
  'Slug'

  ($scope, ItemsCRUD, $location, Slug) ->

    $scope.item = {}

    $scope.addItem = ->
      console.log 'item: ' + JSON.stringify($scope.item)      
      ItemsCRUD.save {}, $scope.item, (
        (response) ->
          console.log 'Success:' + JSON.stringify(response)
          $scope.item = response
          $scope.item = {};
          $location.path '/admin/list'
          return
      ),(errorResponse) ->
          console.log 'Error:' + JSON.stringify(errorResponse)
          return
      return

    return

]

app.controller 'ItemsListController', [

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

app.controller 'ItemsViewController', [
  '$scope'
  '$routeParams'
  'ItemsCRUD'
  ($scope, $routeParams, ItemsCRUD) ->
    itemId = $routeParams.id
    #$scope.blg = 1
    console.log 'itemId: ' + itemId
    ItemsCRUD.get { id: itemId }, ((response) ->
      console.log 'Success:' + JSON.stringify(response)
      $scope.itemDocument = response
      return
    ), (errorResponse) ->
      console.log 'Error:' + JSON.stringify(errorResponse)
      return
    return
]

app.controller 'ItemsDeleteController', [
  '$scope'
  '$routeParams'
  'ItemsCRUD'
  ($scope, $routeParams, ItemsCRUD) ->

    $scope.removeItem = ( itemId ) ->
      console.log 'Item Id is ' + itemId
      return

    return
]
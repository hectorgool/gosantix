'use strict'


dependencies = [
  'items.services'
  'slugifier'
]


app = angular.module('items.controller', dependencies)

app.controller 'ItemsController', [

  '$scope'
  'ItemsCRUD'
  '$location'
  'Slug'
  'ItemsQuery'

  ($scope, ItemsCRUD, $location, Slug, ItemsQuery) ->


    $scope.item = {}

    $scope.itemList = []

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

    ItemsQuery.query {}, ((response) ->
      console.log 'Success:' + JSON.stringify(response)
      $scope.itemList = response
      return
    ), (errorResponse) ->
      console.log 'Error:' + JSON.stringify(errorResponse)
      return

    $scope.removeItem = ( itemId ) ->
      console.log 'Item Id is ' + itemId
      return


    return

]

app.controller 'ItemViewController', [

  '$scope'
  '$routeParams'
  'ItemsCRUD'

  ($scope, $routeParams, ItemsCRUD) ->


    itemId = $routeParams.id
    
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

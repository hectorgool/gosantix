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

    $scope.jsonItem = {}

    $scope.addItem = ->

      $scope.jsonItem =
        'name': $('#name').val()
        'description': $('#description').val()
        'slug': Slug.slugify( $('#name').val() )

      ItemsPost.save {}, $scope.jsonItem, ((response) ->
        console.log 'Success:' + JSON.stringify(response)
        $scope.jsonResponse = response
        #$location.path '/'
        return
      ), (errorResponse) ->
        console.log 'Error:' + JSON.stringify(errorResponse)
        return

      return

    return

  #$scope.slugify = (input) ->
    #$scope.mySlug = Slug.slugify(input)
    #return  

]

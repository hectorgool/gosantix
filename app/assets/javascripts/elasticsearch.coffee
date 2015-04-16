
app = angular.module('myApp', [
  'ngResource'
  'ngRoute'
])

app.controller 'ElasticSearchCtrl', ($scope) ->
  $scope.term = null

  $scope.onKeyUp = ->
    #console.log('$event: ' + $event );      	
    jsonTerm = 
      query: term: 'name.autocomplete': $('#term').val()
      facets: name: terms: field: 'name'
    #http://stackoverflow.com/questions/1625208/print-content-of-javascript-object
    console.log 'jsonTerm: ' + jsonTerm.toSource()
    $scope.term = jsonTerm
    return

  return
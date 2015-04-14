
app = angular.module("myApp", [])

app.controller "ElasticSearchCtrl", [
  "$scope"
  ($scope) ->
    $scope.searchTerm = ->
      console.log "searchTerm"
      query:
        term:
          "name.autocomplete": $("#term").val()

      facets:
        name:
          terms:
            field: "name"
]
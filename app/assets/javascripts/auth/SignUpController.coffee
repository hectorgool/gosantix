
'use  strict'
app = angular.module('myApp.auth', [ 'signupServices' ])
app.controller 'SignUpController', [
  '$scope'
  'SignUpQuery'
  '$location'
  ($scope, SignUpQuery, $location) ->
    $scope.signup = {}

    $scope.addSignUp = ->
      SignUpQuery.save {}, $scope.signup, ((response) ->
        console.log 'Success:' + JSON.stringify(response)
        $scope.jsonResponse = response
        return
      ), (errorResponse) ->
        console.log 'Error:' + JSON.stringify(errorResponse)
        return
      console.log ' firstName: ' + $scope.signup.firstName + ' lastName: ' + $scope.signup.lastName
      $scope.signup = {}
      return

    return
]
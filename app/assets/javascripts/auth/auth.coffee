angular.module('myApp.auth', []).controller 'SignUpController', [
  '$scope'
  ($scope) ->
    $scope.signup = {}

    $scope.addSignUp = ->
      console.log ' firstName: ' + $scope.signup.firstName + ' lastName: ' + $scope.signup.lastName
      $scope.signup = {}
      return

    return
]
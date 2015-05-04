/*
if (window.console) {
  console.log("Welcome to your Play application's JavaScript!");
}
*/

angular.module("myApp.auth", [])
  .controller('SignUpController', ['$scope', function SignUpController( $scope )  {

    $scope.signup = {};

    $scope.addSignUp = function(  ){
      console.log(' firstName: '  + $scope.signup.firstName  + " lastName: " + $scope.signup.lastName);
      $scope.signup = {};
    };

  }]);
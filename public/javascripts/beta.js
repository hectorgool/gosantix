if (window.console) {
  console.log("Welcome to your Play application's JavaScript!");
}


angular.module('myApp', ['ngMaterial', 'ngMessages'])
.controller('AppCtrl', function($scope) {
  $scope.project = {
    description: 'Nuclear Missile Defense System',
    rate: 500
  };
});

(function(){


	'use  strict';
  
  	var app = angular.module("myApp.auth", ['signupServices'])

  	app.controller('SignUpController', [
    	'$scope', 'SignUpQuery', '$location', function($scope, SignUpQuery, $location) {

	    	$scope.signup = {};

	      	$scope.addSignUp = function() {

		        SignUpQuery.save( {}, $scope.signup,

			        (function(response) {
			        	console.log('Success:' + JSON.stringify(response));
			          	$scope.jsonResponse = response;
			        }), 

			        function(errorResponse) {
			          	console.log('Error:' + JSON.stringify(errorResponse));
			        }
			        
		        );

		        console.log(' firstName: ' + $scope.signup.firstName + " lastName: " + $scope.signup.lastName);
				$scope.signup = {};

	      	};

    	}
  	]);


})();


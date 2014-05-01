var navbarControllers = angular.module('navbarControllers', []);

navbarControllers.controller('NavbarController', function($scope, $location) {
	$scope.isActive = function (viewLocation) { 
        return viewLocation === $location.path();
    };
});
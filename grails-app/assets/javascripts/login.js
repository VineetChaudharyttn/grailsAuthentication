// var login=angular.module('loginPage','[ngRoute]');
var login = angular.module('Login', ['ngRoute']);
login.config(function ($routeProvider) {
    $routeProvider.when('/',{
        controller: 'LoginController',
        templateUrl: '/login/login'
    }).when('/sginUp',{
        controller:'SignUpController',
        templateUrl: '/login/signUp'
    }).otherwise({
        renderTo: '/'
    })
});
// var login=angular.module('loginPage','[ngRoute]');
var login = angular.module('Login', ['ngRoute']);
login.config(function ($routeProvider) {
    $routeProvider.when('/',{
        controller: 'LoginController',
        templateUrl: '/login/login'
    }).when('/sginUp',{
        controller:'SignUpController',
        templateUrl: '/login/signUp'
    }).when('/manage/user',{
        controller: 'LoginController',
        templateUrl: '/login/login'
    }).when('/user/tasks',{
        controller: 'LoginController',
        templateUrl: '/login/login'
    }).when('/tasks/:id',{
        controller: 'LoginController',
        templateUrl: '/login/login'
    }).otherwise({
        renderTo: '/'
    })
});
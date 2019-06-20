var app = angular.module('ToDo', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider.when('/',{
        controller: 'TodoController',
        templateUrl: '/welcome/toDo'
    }).when('/:signUp',{
        controller: 'TodoController',
        templateUrl: '/welcome/toDo'
    }).when('/task/:taskId',{
        controller: 'TaskController',
        templateUrl: '/welcome/task'
    }).when('/addTask/add',{
        controller: 'AddTaskController',
        templateUrl: '/taskApi/addTask'
    }).otherwise({
        renderTo: '/'
    });
});


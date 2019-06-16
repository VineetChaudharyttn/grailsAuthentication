var app = angular.module('ToDo', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider.when('/',{
        controller: 'TodoController',
        templateUrl: '/welcome/toDo'
    }).when('/:taskId',{
        controller: 'TaskController',
        templateUrl: '/welcome/task'
    }).when('/addTask/add',{
        controller: 'AddTaskController',
        templateUrl: '/taskApi/addTask'
    }).otherwise({
        renderTo: '/'
    });
});


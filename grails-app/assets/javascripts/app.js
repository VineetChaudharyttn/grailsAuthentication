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
    }).when('/manage/user',{
        controller: 'ManageUserController',
        templateUrl: '/welcome/manageUser'
    }).when('/user/tasks',{
        controller: 'UserTasksController',
        templateUrl: '/welcome/usertasks'
    }).when('/user/tasks/:taskId',{
        controller: 'UserTaskController',
        templateUrl: '/welcome/usertask'
    }).otherwise({
        renderTo: '/'
    });
});


app.controller('UserTasksController',['$scope','alltasks',function ($scope, alltasks) {
    alltasks.success(function (data) {
        $scope.alltasks=data.tasks
    });
}]);
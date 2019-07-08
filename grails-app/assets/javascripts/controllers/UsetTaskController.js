app.controller('UserTaskController',['$scope','alltasks','$routeParams',function ($scope, alltasks,$routeParams) {
    alltasks.success(function (data) {
        console.log(data);
        $scope.task=data.tasks[$routeParams.taskId]
    });
}]);
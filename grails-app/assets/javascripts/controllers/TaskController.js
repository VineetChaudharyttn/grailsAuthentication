app.controller('TaskController',['$scope','tasks','$routeParams',function ($scope,tasks,$routeParams) {
    tasks.success(function (data) {
        $scope.task=data[$routeParams.taskId];
    })
}]);
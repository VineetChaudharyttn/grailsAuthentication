app.controller('TaskController',['$scope','tasks',function ($scope,tasks) {
    tasks.success(function (data) {
        $scope.task=data;
    })
}]);
app.controller('AddTaskController',['$scope','registerService','$window',function ($scope,registerService,$window){
    $scope.RegisterTask=function(){
        registerService.AddTaskToDB($scope.task);
        $window.location.href = '/welcome/index';
    };
    $scope.date= new Date();
}]);
app.controller('TodoController', ['$scope','tasks','registerService', function($scope,tasks,registerService) {
    tasks.success(function(data){
        $scope.tasks=data;
    });
    $scope.update=function (task) {
        console.log("update");
        registerService.updateTaskToDB(task);
    };

}]);
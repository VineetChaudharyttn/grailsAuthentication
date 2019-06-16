app.controller('TodoController', ['$scope','tasks', function($scope,tasks) {
    tasks.success(function(data){
        $scope.tasks=data;
        console.log(data);
    });
}]);
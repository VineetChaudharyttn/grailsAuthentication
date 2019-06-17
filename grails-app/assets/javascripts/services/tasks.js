app.factory('tasks',['$http',function($http){
    return $http.get('/taskApi/index')
        .success(function(data){
            return data;
        }).error(function(err){
            return err;
        });

}]);
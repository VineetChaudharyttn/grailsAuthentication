app.factory('alltasks',['$http',function ($http) {
    return $http.get("/welcome/tasks").success(function (data) {
        return data;
    }).error(function (err) {
        return err;
    });
}]);
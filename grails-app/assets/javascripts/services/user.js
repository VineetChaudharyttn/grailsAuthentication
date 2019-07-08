app.factory('user',['$http',function ($http) {
    return $http.get('/taskApi/user').success(function (data) {
        return data;
    }).error(function (err) {
        return err;
    });
}]);
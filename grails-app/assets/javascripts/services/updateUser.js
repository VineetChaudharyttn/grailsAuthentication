app.factory('updateUser',['$http',function ($http) {
    var fan={};
    fan.changeUserStatus=function (user) {
        console.log(user);
    $http.post("/taskApi/updateUser",user).success(function (responce) {
        console.log(responce);
    }).error(function (err) {
        console.log(err);
    })
    };
    return fan;
}]);
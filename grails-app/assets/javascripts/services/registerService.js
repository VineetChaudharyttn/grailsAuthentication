app.factory('registerService',['$http',function ($http) {
    var fac={};

    fac.AddTaskToDB= function (task) {
        $http.post("/taskApi/save",task).success(function (responce) {

            console.log(responce)

        })
    };
    return fac;
}]);
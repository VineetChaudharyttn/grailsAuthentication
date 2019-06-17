app.factory('registerService',['$http',function ($http) {
    var fac={};

    fac.AddTaskToDB= function (task) {
        console.log("hit save");
        $http.post("/taskApi/save",task).success(function (responce) {

            console.log(responce)

        })
    };

    fac.updateTaskToDB= function (task) {
        console.log(task);
        $http.post("/taskApi/update",task).success(function (responce) {

            console.log(responce);
        });
    };
    return fac;
}]);
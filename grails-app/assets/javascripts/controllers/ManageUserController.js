app.controller('ManageUserController', ['$scope', 'user', 'updateUser',function ($scope, user,updateUser) {
    user.success(function (data) {
        $scope.users = data.users;
    });
    $scope.changeStatus = function (data) {
        updateUser.changeUserStatus(data);
    }
}]);
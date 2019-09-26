<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<body>

<div class="card">
    <div class="card-header">
        <h3>
            Users
        </h3>
    </div>

    <div class="card-body">
        <table class="table">
            <thead class="thead-light">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Username</th>
                <th scope="col">User Status</th>
                <th scope="col">Change User Status</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="userfromlist in users" >
                <th scope="row">{{userfromlist.id}}</th>
                <td>{{userfromlist.firstName}} {{userfromlist.lastName}}</td>
                <td>{{userfromlist.username}}
                </td>
                <td>
                    <span ng-if="userfromlist.enabled">Active</span>
                    <span ng-hide="userfromlist.enabled">Inactive</span>
                </td>
                <td>
                    <input type="checkbox" ng-model="userfromlist.enabled" ng-click="changeStatus(userfromlist);" />
                </td>
            </tr>
            </tbody>
        </table>


        <a href="#/" class="btn btn-primary">Back</a>
    </div>
</div>

</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<body>
<div class="col mt-3">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-3">
                    <h3>
                        Date
                    </h3>
                </div>

                <div class="col-6">
                    <h3>
                        Title
                    </h3>
                </div>
                <div class="col-3">
                    <h3>
                        Status
                    </h3>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row" ng-repeat="task in tasks">
                <div class="col-3">
                    <h4>
                        <a href="#/task/{{$index}}">{{task.date | date}}</a>
                    </h4>
                </div>

                <div class="col-6">
                    <h4>
                        <a href="#/task/{{$index}}">{{task.title}}</a>
                    </h4>
                </div>
                <div class="col-3">
                    <h3>
                        <input type="checkbox" ng-model="task.status" ng-click="update(task);" />
                    </h3>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="row">
                <div class="col-9">

                </div>
                <a class="btn btn-outline-success" href="#/addTask/add">+</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
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

                <div class="col-3">
                    <h3>
                        Title
                    </h3>
                </div>
                <div class="col-3">
                    <h3>
                        Status
                    </h3>
                </div><div class="col-3">
                <h3>
                    User Id
                </h3>
            </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row" ng-repeat="task in alltasks">
                <div class="col-3">
                    <h4>
                        <a href="#/user/tasks/{{$index}}">{{task.date | date}}</a>
                    </h4>
                </div>

                <div class="col-3">
                    <h4>
                        <a href="#/user/tasks/{{$index}}">{{task.title}}</a>
                    </h4>
                </div>
                <div class="col-3">
                    <h3>
                        <a href="#/user/tasks/{{$index}}">
                            <span ng-if="task.status">Complete</span>
                            <span ng-hide="task.status">Panding</span>
                        </a>
                    </h3>
                </div>
                <div class="col-3">
                    <h3>
                        <a href="#/user/tasks/{{$index}}">
                            {{task.user.id}}
                        </a>
                    </h3>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="row">
                <div class="col-9">

                </div>
                <a href="#" class="btn btn-primary">Back</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
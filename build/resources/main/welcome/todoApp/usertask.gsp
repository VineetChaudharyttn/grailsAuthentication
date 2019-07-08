<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<body>

<div class="card">
    <div class="card-header">
        <h2>User Id:
            {{task.user.id}}
        </h2>
        <h2>
            {{task.title}}
        </h2>
        <div class="float-right">
            Status :
            <span ng-if="task.status">Completed</span>
            <span ng-hide="task.status">Panding</span>
        </div>
    </div>

    <div class="card-body">
        <h5 class="card-title">{{task.date | date}}</h5>

        <p class="card-text">{{task.task}}</p>

        <a href="#/user/tasks" class="btn btn-primary">Back</a>
    </div>
</div>

</body>
</html>
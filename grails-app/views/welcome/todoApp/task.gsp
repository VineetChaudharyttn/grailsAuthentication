<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>
    <div class="card">
        <div class="card-header">
            {{task.title}}
        </div>
        <div class="card-body">
            <h5 class="card-title">{{task.date | date}}</h5>
            <p class="card-text">{{task.task}}</p>
            <a href="#/" class="btn btn-primary">Back</a>
        </div>
    </div>
</h1>
</body>
</html>
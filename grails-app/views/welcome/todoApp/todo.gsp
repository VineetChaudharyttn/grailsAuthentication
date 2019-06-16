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
            <div class="row">
                <div class="col-3">
                    <h2>

                    </h2>
                </div>

                <div class="col-6">
                    <h2>

                    </h2>
                </div>
                <div class="col-3">
                    <h3>

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


    <div ng-repeat="task in tasks">

        <a href="#/{{$index}}">taskApi</a>
    </div>
</div>
</body>
</html>
<html>
<head>
    <title>
        Welcome
    </title>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.5/angular.min.js"></script>
    <script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>

<body ng-app="ToDo">

<div class="container">
    <!-- Content here -->

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index">
            <asset:image src="todo.png"></asset:image>
            TODO
        </a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto float-right">

                <li class="float-right">Welcome ${user.firstName} ${user.lastName}</li>
            </ul>

            <form class="form-inline my-2 my-lg-0">
                <a class="btn btn-outline-success my-2 my-sm-0" href="/logoff">Logout</a>
            </form>
        </div>
    </nav>

    <div ng-view class="mt-3"></div>
</div>

%{-- modules --}%

<asset:javascript src="app.js"/>

%{-- controllers --}%

<asset:javascript src="controllers/TaskController.js"></asset:javascript>

<asset:javascript src="controllers/TodoController.js"></asset:javascript>

<asset:javascript src="controllers/AddTaskController.js"></asset:javascript>

%{-- services --}%

<asset:javascript src="services/tasks.js"></asset:javascript>

<asset:javascript src="services/registerService.js"></asset:javascript>

%{--<asset:javascript src="services/updateStatus.js"></asset:javascript>--}%
</body>
</html>
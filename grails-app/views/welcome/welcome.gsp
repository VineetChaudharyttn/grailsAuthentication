<html>
<head>
    <title>
        Welcome
    </title>
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.5/angular.min.js"></script>
    <script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
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
                <li class="float-right">

                </li>
            </ul>

            <form class="form-inline my-2 my-lg-0">
                <a class="btn btn-outline-success my-2 my-sm-0" href="/logoff">Logout</a>
            </form>
        </div>
    </nav>

    <div ng-view class="mt-3"></div>

    <g:if test="${flash.message != null}">
        <div class="alert alert-success" role="alert">
            <g:message code="${flash.message}" args="${flash.args}" default="${flash.message}"/>
        </div>
    </g:if>
</div>

<div class="modal fade" id="invite" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title align-content-center">Invite Your friends</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <p>Enter the email address of your friend and we'll send a invitation link to your friend!</p>

                <div class="panel panel-primary">
                    <div class="panel-body">
                        <form action="/welcome/invite" method="post">
                            <div class="newer-row form-label-group">
                                <input type="email" ng-model="user.username" name="username" class="form-control"
                                       placeholder="Email address" required
                                       autofocus>
                            </div>

                            <div class="modal-footer">
                                <div class="form-group">

                                    <button type="submit" class="btn btn-primary">invite</button>

                                    <button type="button" class="btn btn-primary"
                                            data-dismiss="modal">Close</button>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
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
</body>
</html>
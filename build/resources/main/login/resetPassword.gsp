<!DOCTYPE html>
<html>
<head>
    <title>Facebook Login JavaScript Example</title>
    <meta charset="UTF-8">
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
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

<body>

<div class="container">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index">
            <asset:image src="todo.png"></asset:image>
            TODO
        </a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto float-right">

                <li class="float-right"></li>
            </ul>

            <form class="form-inline my-2 my-lg-0">

            </form>
        </div>
    </nav>

    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-login-tab" data-toggle="tab" href="#nav-login" role="tab"
               aria-controls="nav-login" aria-selected="false">Reset Password</a>

        </div>
    </nav>
    <div class="tab-content p-4" id="nav-tabContent">
        <div class="tab-pane fade  show active" id="nav-login" role="tabpanel" aria-labelledby="nav-login-tab">
            <!-- Login form -->
            <form id="registeration" action="/login/updatePass" class="form-horizontal" method="post"
                  autocomplete="off">
                <div class="newer-row form-label-group">
                    <input type="password" id="confirmpassword" class="form-control" placeholder="Password" required
                           autofocus>
                </div>

                <div class="newer-row form-label-group">
                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                </div>
                <input type="hidden" name="resetToken" value="${user.resetToken}"/>
                <span id="err" class="alert-danger"></span>

                <div class="newer-row">
                    <button class="btn btn-success btn-lg btn-block" type="submit">Reset</button>
                </div>
            </form>
        </div>
    </div>

</div>

<asset:javascript src="confirmPass.js"></asset:javascript>
</body>
</html>

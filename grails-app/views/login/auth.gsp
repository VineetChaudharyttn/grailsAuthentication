<!DOCTYPE html>
<html>
<head>
    <title>Facebook Login JavaScript Example</title>
    <meta charset="UTF-8">
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.5/angular.min.js"></script>
    <script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
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

<body ng-app="Login">
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v3.3&appId=2573086076058448&autoLogAppEvents=1"></script>

<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        var password = response.authResponse.accessToken;
        console.log(response);
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            FB.api('/me', {fields: ['email', 'first_name', 'last_name', 'id']}, function (response) {
                //var randomstring = Math.random().toString(36).slice(-8);
                $.ajax({
                    url: "/welcome/register",
                    method: "POST",
                    data: {
                        "username": response.email,
                        "firstname": response.first_name,
                        "lastname": response.last_name,
                        "password": password
                    },
                    success: function (msg) {
                        // document.getElementById('username').value = response.email;
                        // document.getElementById('password').value = response.id;
                        // document.getElementById("submit").click();
                        $.ajax({
                                url: "/login/facebookLogin",
                                method: "POST",
                                data: {
                                    "username": response.email,
                                    "firstname": response.first_name,
                                    "lastname": response.last_name
                                },
                                success: function (msg) {
                                    window.location = "/welcome/index";
                                }
                            }
                        );
                    }
                });
            });
            // testAPI();
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '{your-app-id}',
            cookie: true,  // enable cookies to allow the server to access
                           // the session
            xfbml: true,  // parse social plugins on this page
            version: '{api-version}' // The Graph API version to use for the call
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));


</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->
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
%{--
    <div class="btn-group-toggle mt-3" data-toggle="buttons">

        <a class="btn btn-secondary float-right mr-3 " type="radio" name="options" id="option1"
           data-toggle="tab" href="#nav-signup">Register</a>
        <a class="btn btn-secondary float-right mr-3 " type="radio" name="options" id="option2"
           data-toggle="tab" href="#nav-login">Login</a>
    </div>
    --}%


<div ng-view></div>


    %{--
    <div class="tab-content p-4" id="nav-tabContent">
        <div class="tab-pane fade  show active" id="nav-login" role="tabpanel" aria-labelledby="nav-login-tab">
            <!-- Login form -->
            <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform"
                  autocomplete="off">
                <div class="form-group">
                    <label for="username">Email address</label>
                    <input type="email" class="form-control text_" aria-describedby="emailHelp"
                           name="${usernameParameter ?: 'username'}" id="username" placeholder="Enter email"
                           required
                           autofocus>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control text_" name="${passwordParameter ?: 'password'}"
                           id="password"
                           placeholder="Password" required>
                </div>

                <button type="submit" class="btn btn-primary ml-3" id="submit"
                        value="${message(code: 'springSecurity.login.button')}">Login</button>
            </form>
            <a href="#" class="btn btn-secondary float-right mr-3" data-dismiss="modal" data-toggle="modal"
               data-target="#forgotPassword">Forgot Password</a>



            <br/>
            <fb:login-button scope="public_profile,email" class="ml-3" onlogin="checkLoginState();">
                <i class="fab fa-facebook mr-2"></i> Sign In with facebook
            </fb:login-button>

        </div>

        <div class="tab-pane fade" id="nav-signup" role="tabpanel" aria-labelledby="nav-signup-tab">
            <form action="/login/register" method="post" >
                <div class="newer-row form-label-group">
                    <input type="text" ng-model="user.firstname" name="firstname" minlength="3" maxlength="20" id="inputFirstName"
                           class="form-control"
                           placeholder="First name" required
                           autofocus>
                </div>

                <div class="newer-row form-label-group">
                    <input type="text" ng-model="user.lastname" name="lastname" minlength="3" maxlength="20" id="inputLastName"
                           class="form-control"
                           placeholder="Last name" required>
                </div>

                <div class="newer-row form-label-group">
                    <input type="email" ng-model="user.username" name="username" id="inputEmail" maxlength="35" class="form-control"
                           placeholder="Email address" required
                           autofocus>

                    <div id="unavail"></div>
                </div>

                <div class="newer-row form-label-group">
                    <input type="password" id="confirmpassword"  class="form-control" minlength="6" maxlength="10"
                           placeholder="Password" required>
                </div>

                <div class="newer-row form-label-group">
                    <input type="password" ng-model="user.password" name="password" id="inputPassword" class="form-control"
                           placeholder="Confirm Password" required>
                    <div id="err"></div>
                </div>

                <div class="newer-row">
                    <button class="btn btn-success btn-lg btn-block" id="confirm" type="submit">Sign up</button>
                </div>
            </form>

        </div>


    </div>
--}%
    <br/>
    <g:if test="${flash.error != null}">
        <div class="alert alert-danger" role="alert">
            <g:message code="${flash.error}" args="${flash.args}" default="${flash.error}"/>
        </div>
    </g:if>
    <g:if test="${flash.message != null}">
        <div class="alert alert-success" role="alert">
            <g:message code="${flash.message}" args="${flash.args}" default="${flash.message}"/>
        </div>
    </g:if>
    <div class="modal fade" id="forgotPassword" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title align-content-center">Forgot Password</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <p>Enter your Email address and we'll send you a link to reset your password!</p>

                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <form action="/login/resetPassword" method="post" enctype="multipart/form-data" name="forget" novalidate>
                                <div class="newer-row form-label-group">
                                    <input type="email" ng-model="user.username" name="username" class="form-control"
                                           placeholder="Email address" ng-model="username" ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" ng-model-options="{ updateOn: 'blur' }" required
                                           autofocus>

                                    <span style="color:Red" ng-show="forget.username.$dirty&&forget.username.$error.pattern">Please Enter Valid Email</span>
                                </div>

                                <div class="modal-footer">
                                    <div class="form-group">

                                        <button type="submit" class="btn btn-primary" ng-disabled="forget.$invalid">Reset Password</button>

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
</div>

<asset:javascript src="login.js"></asset:javascript>
<asset:javascript src="controllers/LoginController.js"></asset:javascript>
<asset:javascript src="controllers/SignUpController.js"></asset:javascript>
<asset:javascript src="confirmPass.js"></asset:javascript>
<asset:javascript src="chackMailAvailability.js"></asset:javascript>
</body>
</html>



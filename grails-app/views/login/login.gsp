<html>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-10 col-xl-9 mx-auto">
            <div class="card card-signin flex-row my-5">
                <div class="card-img-left d-none d-md-flex">
                    <!-- Background image for card set in CSS! -->
                </div>
                <div class="card-body">
                    <h5 class="card-title text-center">Login</h5>
                    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" name="login" class="cssform"
                          novalidate autocomplete="off">
                        <div class="form-label-group">
                            <input type="email" class="form-control text_" aria-describedby="emailHelp"
                                   name="${usernameParameter ?: 'username'}" id="username" ng-model="username" ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" placeholder="Enter email"
                                   required
                                   autofocus>
                            <label for="username">Username</label>

                            <span style="color:Red" ng-show="login.username.$dirty&&login.username.$error.pattern">Please Enter Valid Email</span>
                        </div>

                        <div class="form-label-group">
                            <input type="password" minlength="6" class="form-control text_" ng-model="password" name="${passwordParameter ?: 'password'}"
                                   id="password"
                                   placeholder="Password" required>
                            <label for="password">Password</label>
                        </div>

                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" ng-disabled="login.$invalid">Sign In</button>
                        <a class="d-block text-center mt-2 small" href="#/sginUp">Sign Up</a>
                        <hr class="my-4">

                    </form>
                    <button class="btn btn-lg btn-google btn-block text-uppercase" >
                    <fb:login-button scope="public_profile,email" class="ml-3" onlogin="checkLoginState();">
                        <i class="fab fa-facebook mr-2"></i> Sign In with facebook
                    </fb:login-button>
                    </button>
                    <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit">
                        <a data-dismiss="modal" data-toggle="modal"
                           data-target="#forgotPassword">
                            <i class="fab fa-password mr-2"></i> Forgot Password
                        </a>
                    </button>


                </div>
            </div>
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
        </div>
    </div>
</div>
</body>
</html>
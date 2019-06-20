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
                    <h5 class="card-title text-center">Register</h5>
                    <form action="/login/register" method="post" name="signup" >
                        <div class="form-label-group">
                            <input type="text" class="form-control" id="inputFirstName" name="firstname" placeholder="First Name" ng-model="firstname" required autofocus>
                            <label for="inputFirstName">First Name</label>
                        </div>
                        <div class="form-label-group">
                            <input type="text" class="form-control" id="inputLastName" name="lastname" placeholder="Last Name" ng-model="lastname" required autofocus>
                            <label for="inputLastName">Last Name</label>
                        </div>
                        <div class="form-label-group">
                            <input type="text" class="form-control" id="inputEmail" name="username" placeholder="Username" ng-model="username" ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" required autofocus>
                            <label for="inputEmail">Username</label>

                            <span style="color:Red" ng-show="signup.username.$dirty&&signup.username.$error.pattern">Please Enter Valid Email</span>
                        </div>
                        <div id="unavail"></div>

                        <hr>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" minlength="6" name="password" class="form-control" ng-model="pass" placeholder="Password" required>
                            <label for="inputPassword">Password</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="confirmpassword" class="form-control" placeholder="Password" name="confirm" ng-model="conferm" required>
                            <label for="confirmpassword">Confirm password</label>
                        </div>
                        <div id="err"></div>

                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" ng-disabled="signup.$invalid">Sign Up</button>
                        <a href="http://localhost:8080/login/auth" class="d-block text-center mt-2 small">Sign In</a>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
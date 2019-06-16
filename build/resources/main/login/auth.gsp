<!DOCTYPE html>
<html>
<head>
    <title>Facebook Login JavaScript Example</title>
    <meta charset="UTF-8">
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v3.3&appId=2573086076058448&autoLogAppEvents=1"></script>

<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        var password=response.authResponse.accessToken;
        console.log(response);
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            FB.api('/me',{fields: ['email','first_name','last_name','id']}, function(response) {
                //var randomstring = Math.random().toString(36).slice(-8);
                $.ajax({
                    url:"/welcome/register",
                    method:"POST",
                    data:{"username":response.email,"firstname":response.first_name,"lastname":response.last_name,"password":password},
                    success: function(msg) {
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
                                    window.location="/welcome/index";
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
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '{your-app-id}',
            cookie     : true,  // enable cookies to allow the server to access
                                // the session
            xfbml      : true,  // parse social plugins on this page
            version    : '{api-version}' // The Graph API version to use for the call
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

        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->
<form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
    <table>
        <tr>
            <td>
                Username
            </td>
            <td>
                <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
            </td>
        </tr>

        <tr>
            <td>
                Password
            </td>
            <td>
                <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
            </td>
        </tr>

        <tr>
            <td>
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
            </td>
            <td>
                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
            </td>
        </tr>

        <tr>
            <td>

            </td>
            <td>
                <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
            </td>
        </tr>

        <tr>
            <td>

            </td>
            <td>
                %{--<div class="fb-login-button" data-width="" data-size="large" data-button-type="continue_with" data-auto-logout-link="false" data-use-continue-as="false"></div>--}%
                <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
                </fb:login-button>
            </td>
        </tr>
    </table>
</form>


<div id="status">
</div>

</body>
</html>



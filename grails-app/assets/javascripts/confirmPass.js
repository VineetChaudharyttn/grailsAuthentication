$(document).click(function () {
    $('#confirmpassword').blur(function () {
        var password = document.getElementById("inputPassword")
            , confirm_password = document.getElementById("confirmpassword");
            console.log(password.value);
            console.log(confirm_password.value);
        if(password.value != confirm_password.value) {
            $('#err').html("<span class='badge badge-danger'>Passwords Don't Match</span>");
            $('#confirmpassword').val("");
        } else {
            $('#err').text("");
        }
    })

});
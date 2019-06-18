package grailsAuthentication

import com.grailsAuthentication.Role
import com.grailsAuthentication.User
import com.grailsAuthentication.UserRole
import grails.converters.JSON

class LoginController extends grails.plugin.springsecurity.LoginController {

    def springSecurityService

    @Override
    def auth() {
        def conf = getConf()
        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }

        log.info(" Login page")

        String postUrl = request.contextPath + conf.apf.filterProcessesUrl
        render view: 'auth', model: [postUrl            : postUrl,
                                     rememberMeParameter: conf.rememberMe.parameter,
                                     usernameParameter  : conf.apf.usernameParameter,
                                     passwordParameter  : conf.apf.passwordParameter,
                                     gspLayout          : conf.gsp.layoutAuth]
    }


    def facebookLogin(UserCO userCO) {
        def userDetails = User.findByUsername(userCO.username)
        if (userDetails) {
            springSecurityService.reauthenticate(userDetails.username)
        }
        log.info("FaceBook Authentication success")
        return true
    }

    def authfail() {
        log.info("Authentication fails")
        def msg = "Wrong EmailId or Password !!!! please retry."
        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        } else {
            flash.error = msg
            redirect action: 'auth', params: params
        }
    }

    def resetPassword(UserCO userCO) {
        User user= User.findByUsername(userCO.username)
        def msg
        if (user==null) {
            println("not found")
            msg = "We didn't found an account for that "+userCO.username+" address."
            if (springSecurityService.isAjax(request)) {
                render([error: msg] as JSON)
            } else {
                flash.error = msg
                redirect action: 'auth', params: params
            }
        } else {
//            user.setResetToken(UUID.randomUUID().toString())
//
//            user.save(flush:true,failOnError:true)
//
//            String message="To reset your password, click the link below:\n http://localhost:8080/reset?token=" + user.getResetToken()
//            String subject="Password Reset Request"
//            emailService.sandMail(user,message,subject)

            msg="A password reset link has been sent to " + userCO.username
            if (springSecurityService.isAjax(request)) {
                render([message: msg] as JSON)
            } else {
                flash.message = msg
                redirect action: 'auth', params: params
            }
        }

    }
/*

    def setNewPassword(String token) {
        Optional<User> optional = userService.findUserByResetToken(token);
        if (!optional.isPresent()) {
            model.addAttribute("errorMessage", "Sorry token is Already used.");
            model.addAttribute("user", new User());
            return "login";
        }
        User user = new User();
        user.setResetToken(token);
        model.addAttribute("user", user);
        return "passwordreset";
    }


    def update(User user) {
        Optional<User> optionalUser = userService.findUserByResetToken(user.getResetToken());
        String password = user.getPassword();
        if (optionalUser.isPresent()) {
            user = optionalUser.get();
        } else {
            model.addAttribute("errorMessage", "Password not reset successfully, You not may Login .........");
            return "login";
        }
        user.setPassword(bCryptPasswordEncoder.encode(password));
        user.setResetToken(null);
        userService.register(user);
        model.addAttribute("successMessage", "Password reset successfully, You may Login .........");

        return "login";
    }*/

    def forget() {
        render(view: "forget")
    }

    def register(UserCO userCO) {
        User user=new User()

        user.username= userCO.username
        user.firstName= userCO.firstname
        user.lastName= userCO.lastname
        user.password=userCO.password
        println(userCO)
        def role = Role.findByAuthority('ROLE_USER')
        user.save(flush:true,failOnError:true)
        UserRole userRole = new UserRole();
        userRole.setUser(user)
        userRole.setRole(role)
        userRole.save(flush:true,failOnError:true)
        user.save(flush:true,failOnError:true)
        def msg = "register successfully"
        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        } else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }

    def checkAvailability(String username){
        User user=User.findByUsername(username)
        if (user==null){
            render ""
        }
        else
            render "<span class='badge badge-danger'>User is already exists " + username + "</span>"
    }
}

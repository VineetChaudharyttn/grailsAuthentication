package grailsAuthentication

import com.grailsAuthentication.Role
import com.grailsAuthentication.User
import com.grailsAuthentication.UserRole
import grails.converters.JSON

class LoginController extends grails.plugin.springsecurity.LoginController {

    def springSecurityService

    def mailService

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
        log.info("Password reset token is generated")
        User user= User.findByUsername(userCO.username)
        def msg
        if (!user) {
            msg = "We cann't found an account for "+userCO.username+" address."
            if (springSecurityService.isAjax(request)) {
                render([error: msg] as JSON)
            } else {
                flash.error = msg
                redirect action: 'auth', params: params
            }
        } else {
            user.setResetToken(UUID.randomUUID().toString())

            user.save(flush:true,failOnError:true)

            String message="To reset your password, click the link below:\n http://localhost:8080/login/setNewPassword?token=" + user.getResetToken()
            mailService.sendMail {
                to user.username
                from "faltu4209211@gmail.com"
                subject "Password Reset Request"
                text message
            }
            msg="A password reset link has been sent to " + userCO.username
            if (springSecurityService.isAjax(request)) {
                render([message: msg] as JSON)
            } else {
                flash.message = msg
                redirect action: 'auth', params: params
            }
        }

    }


    def setNewPassword(String token) {
        log.info("Password reset using mail token")
        def msg
        User user = User.findByResetToken(token)
        if (!user) {
            msg="Sorry token is Already used."
            if (springSecurityService.isAjax(request)) {
                render([error: msg] as JSON)
            } else {
                flash.error = msg
                redirect action: 'auth', params: params
            }
        }
        else{
            render(view: "resetPassword",model: [user:user])
        }
    }


    def updatePass(UserCO userCO) {
        log.info("Updating password reset by user")
        User user = User.findByResetToken(userCO.resetToken)
        user.setPassword(userCO.password)
        user.setResetToken(null)
        user.save(flush:true,failOnError:true)

        def msg="Password reset successfully, You may Login ........."

        if (springSecurityService.isAjax(request)) {
            render([message: msg] as JSON)
        } else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }


    def register(UserCO userCO) {
        log.info("New user register")
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
        log.info("Checking user existence")
        User user=User.findByUsername(username)
        if (!user){
            render ""
        }
        else
            render "<span class='badge badge-danger'>User is already exists " + username + "</span>"
    }
}

package grailsAuthentication

import com.grailsAuthentication.User
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


    def facebookLogin(UserCO userCO){
        def userDetails = User.findByUsername(userCO.username)
        if (userDetails){
            springSecurityService.reauthenticate(userDetails.username)
        }
        log.info("FaceBook Authentication success")
        return true
    }

    def authfail(){
        log.info("Authentication fails")
        def msg="Wrong EmailId or Password !!!! please retry."
        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        }
        else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }

}

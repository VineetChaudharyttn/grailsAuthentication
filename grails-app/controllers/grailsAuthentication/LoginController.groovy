package grailsAuthentication

import com.grailsAuthentication.User
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.userdetails.GrailsUserDetailsService
import org.apache.tomcat.util.net.jsse.openssl.Authentication

class LoginController extends grails.plugin.springsecurity.LoginController {

    def springSecurityService
    def grailsUserDetailsService

    @Override
    def auth() {
        def conf = getConf()
        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }

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
        return true
    }
}

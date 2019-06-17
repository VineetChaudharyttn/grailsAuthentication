package grailsAuthentication

import com.grailsAuthentication.Task
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.access.annotation.Secured

@Secured("ROLE_USER")
class TodoController {

    SpringSecurityService springSecurityService

    def pending() {
        respond Task.findAllByUser(springSecurityService.currentUser)
    }
}

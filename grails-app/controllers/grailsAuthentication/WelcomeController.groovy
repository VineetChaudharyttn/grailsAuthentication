package grailsAuthentication

import com.grailsAuthentication.Role
import com.grailsAuthentication.User
import com.grailsAuthentication.UserRole
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.access.annotation.Secured

@Secured("permitAll")
class WelcomeController {

    SpringSecurityService springSecurityService
    @Secured("ROLE_USER")
    def index() {
        log.info("ToDo application access")
        render(view: "welcome",model:["user":springSecurityService.currentUser] )
    }


    @Secured("permitAll")
    def register(UserCO userCO){
        println(userCO.username)
        User user=User.findByUsername(userCO.username)
        println(user.username)
        if (user==null){

            log.info("User registeration")
            user=new  User()
            user.username= userCO.username
            user.firstName= userCO.firstname
            user.lastName= userCO.lastname
            user.password=userCO.password
            def role = Role.findByAuthority('ROLE_USER')
            user.save(flush:true,failOnError:true)
            UserRole userRole = UserRole.findOrCreateByUserAndRole(user,role)
            userRole.save(flush:true,failOnError:true)
            user.save(flush:true,failOnError:true)
            render "register"
        }

        else render "exist"
    }

    @Secured("ROLE_USER")
    def toDo(){
        render(view: "todoApp/todo")
    }


    @Secured("ROLE_USER")
    def task(){
        render(view: "todoApp/task")
    }


}

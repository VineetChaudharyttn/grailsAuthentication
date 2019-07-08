package grailsAuthentication

import com.grailsAuthentication.Role
import com.grailsAuthentication.Task
import com.grailsAuthentication.User
import com.grailsAuthentication.UserRole
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.access.annotation.Secured

@Secured("permitAll")
class WelcomeController {

    SpringSecurityService springSecurityService

    def mailService
    @Secured(["ROLE_USER","ROLE_ADMIN"])
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

    @Secured(["ROLE_USER","ROLE_ADMIN"])
    def toDo(){
        render(view: "todoApp/todo")
    }


    @Secured(["ROLE_USER","ROLE_ADMIN"])
    def task(){
        render(view: "todoApp/task")
    }

    @Secured("ROLE_ADMIN")
    def manageUser(){
        render (view: "todoApp/manageuser")
    }

    def invite(UserCO userCO){
        User user=springSecurityService.currentUser
        user=User.findByUsername(user.username)
        String message="Hiiii..... \n You have been invited to join ToDo application by you friend "+user.firstName+" "+user.lastName+ ". \nPlease visit the link bellow \n http://localhost:8080/login/auth#/sginUp\n\n\nThankyou"
        mailService.sendMail {
            to userCO.username
            subject 'Invitation from your friend '+user.username
            from "faltu4209211@gmail.com"
            text message
        }
        message="Invitation is successfully sent to "+userCO.username
        if (springSecurityService.isAjax(request)) {
            render([message: message] as JSON)
        } else {
            flash.message = message
            redirect  action: 'index', params: params
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

    @Secured("ROLE_ADMIN")
    def usertasks(){
        render(view: "todoApp/usertasks")
    }

    @Secured("ROLE_ADMIN")
    def tasks(){
        Map response=[status:'success']
        List<Task> taskList=Task.findAll()
        response.tasks=taskList
        render response as JSON
    }

    @Secured("ROLE_ADMIN")
    def usertask(){
        render(view: "todoApp/usertask")
    }

}

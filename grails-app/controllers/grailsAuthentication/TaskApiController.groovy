package grailsAuthentication

import com.grailsAuthentication.Task
import com.grailsAuthentication.User
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.rest.*
import org.springframework.security.access.annotation.Secured

@Secured("ROLE_USER")
//@Resource(uri = "/todos",formats = ["jspn"])
class TaskApiController {

    SpringSecurityService springSecurityService

    def index() {
        def task=Task.findAllByUser(springSecurityService.currentUser)
        if(task==null){
            log.info("No task in database")
            render "empty"
        }
        else{
            log.info("Tasks fatched from database")
            render task as JSON
        }
    }

    def addTask(){
        log.info("New task Form")
        render (view: "addTask")
    }

    def save(Task task){
        task.setUser(springSecurityService.currentUser)
        task.setStatus(false)
        task.save(flush: true,failOnError:true)
        log.info("Task register successfully")
        render "Success"
    }

    def update(Task task){
        log.info("Task status changed")
        Task.executeUpdate("update Task set status = "+task.status+" where id = "+task.id)
        render "success"
    }
}

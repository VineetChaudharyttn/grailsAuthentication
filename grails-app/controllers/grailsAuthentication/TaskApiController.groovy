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
        if(task==null)
            render "empty"
        else{
            render task as JSON
        }
    }

    def addTask(){
        render (view: "addTask")
    }

    def save(Task task){
        task.setUser(springSecurityService.currentUser)
        task.setStatus(false)
        task.save(flush: true,failOnError:true)
        render "Success"
    }

    def update(Task task){
        println(task)
        def state=Task.executeUpdate("update Task set status = "+task.status+" where id = "+task.id)
        Task task1=Task.findById(task.id)
        println(state)
        task1.setStatus(task.status)
        println(task1)
        render "success"
    }
}

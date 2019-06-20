package grailsAuthentication

import com.grailsAuthentication.Task
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.access.annotation.Secured

@Secured("ROLE_USER")
class TaskApiController {

    SpringSecurityService springSecurityService

    def index() {
        Map response = [status: 'Success']
        List<Task> tasks = Task.findAllByUser(springSecurityService.currentUser)
        if (tasks.size() == 0) {
            response.message = 'No Task found in DB'
        }
        response.tasks = tasks
        render response as JSON
    }

    def addTask() {
        log.info("New task Form")
        render(view: "addTask")
    }

    def save(Task task) {
        task.setUser(springSecurityService.currentUser)
        task.setStatus(false)
        task.save(flush: true, failOnError: true)
        log.info("Task register successfully")
        render "Success"
    }

    def update(Task task) {
        log.info("Task status changed")
        Task.executeUpdate("update Task set status = " + task.status + " where id = " + task.id)
        render "success"
    }


}

package grailsAuthentication

import com.grailsAuthentication.Task
import grails.plugin.springsecurity.SpringSecurityService

class TaskApiController {

    SpringSecurityService springSecurityService

    def index() {
        Task task = Task.findByUser(springSecurityService.currentUser)
        if (task == null)
            render "empty"
        else
            render(model: task)
    }

    def addTask() {
        render(view: "addTask")
    }

    def save(Task task) {
        task.setUser(springSecurityService.currentUser)
        task.setStatus(false)
        task.save(flush: true, failOnError: true)
        render "Success"
    }
}

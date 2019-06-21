import com.grailsAuthentication.Role
import com.grailsAuthentication.Task
import com.grailsAuthentication.User
import com.grailsAuthentication.UserRole

class BootStrap {

    def init = { servletContext ->
        log.info("Bootstrap data loading")
        def user= User.findOrSaveWhere(username: "vineet.chaudhary@tothenew.com",password: "123456",firstName: "Vineet",lastName: "Chaudhary")
        def userRole= Role.findOrSaveWhere(authority:"ROLE_USER")
        def adminRole= Role.findOrSaveWhere(authority:"ROLE_ADMIN")

        def user1= User.findOrSaveWhere(username: "vineetchaudhary727@gmail.com",password: "123456",firstName: "Vineet",lastName: "Chaudhary")

        UserRole.create(user,userRole)

        UserRole.create(user1,adminRole)
//        def task= Task.findOrSaveWhere(title: "Title user",task: "Details of Task",user: user,date: new Date())
//
//        def task1= Task.findOrSaveWhere(title: "Title user1",task: "Details of Task",user: user1,date: new Date())

    }
    def destroy = {
    }
}

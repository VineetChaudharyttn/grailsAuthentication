import com.grailsAuthentication.Role
import com.grailsAuthentication.Task
import com.grailsAuthentication.User
import com.grailsAuthentication.UserRole

class BootStrap {

    def init = { servletContext ->
        log.info("Bootstrap data loading")
        def user= User.findOrSaveWhere(username: "vineet.chaudhary@tothenew.com",password: "1234",firstName: "Vineet",lastName: "Chaudhary")
        def role= Role.findOrSaveWhere(authority:"ROLE_USER")

        def user1= User.findOrSaveWhere(username: "vineetchaudhary727@gmail.com",password: "1234",firstName: "Vineet",lastName: "Chaudhary")

        UserRole.create(user,role)

        UserRole.create(user1,role)
//        def task= Task.findOrSaveWhere(title: "Title user",task: "Details of Task",user: user,date: new Date())
//
//        def task1= Task.findOrSaveWhere(title: "Title user1",task: "Details of Task",user: user1,date: new Date())

    }
    def destroy = {
    }
}

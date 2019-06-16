import com.grailsAuthentication.Role
import com.grailsAuthentication.User
import com.grailsAuthentication.UserRole

class BootStrap {

    def init = { servletContext ->
        def user= User.findOrSaveWhere(username: "vineet.chaudhary@tothenew.com",password: "1234",firstName: "Vineet",lastName: "Chaudhary")
        def role= Role.findOrSaveWhere(authority:"ROLE_USER")

        UserRole.create(user,role)
    }
    def destroy = {
    }
}

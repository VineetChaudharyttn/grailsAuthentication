package grailsAuthentication

class UserCO implements grails.validation.Validateable {
    String username
    String firstname
    String lastname
    String password

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        firstname blank: false
        lastname blank: false
        password blank: false
    }


    @Override
    public String toString() {
        return "UserCO{" +
                "username='" + username + '\'' +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

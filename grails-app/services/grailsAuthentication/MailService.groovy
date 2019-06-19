package grailsAuthentication

import grails.transaction.Transactional

@Transactional
class MailService {


    def sendMail() {
        mailService.sendMail {
            to user.username
            from "faltu4209211@gmail.com"
            subject "Password Reset Request"
            text message
        }
    }
}

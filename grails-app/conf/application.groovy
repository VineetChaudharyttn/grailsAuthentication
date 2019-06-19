

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.grailsAuthentication.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.grailsAuthentication.UserRole'
grails.plugin.springsecurity.authority.className = 'com.grailsAuthentication.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]


grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/welcome/index'
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true

//grails.plugin.springsecurity.auth.loginFormUrl = '/'
grails.plugin.springsecurity.logout.postOnly = false
logout.afterLogoutUrl = "/"
grails.plugin.springsecurity.apf.storeLastUsername = true
grails.plugin.springsecurity.password.algorithm = 'bcrypt'

grails {
	mail {
		host = "smtp.gmail.com"
		port = 465
		username = "faltu4209211@gmail.com"
		password = "4209211faltu"
		props = ["mail.smtp.auth":"true",
				 "mail.smtp.socketFactory.port":"465",
				 "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
				 "mail.smtp.socketFactory.fallback":"false"]
	}
}
ActionMailer::Base.smtp_settings = {
    address: "smtp.googlemail.com",
    port: 587,
    domain: "service-b.org",
    user_name: ENV['MAIL_USER'],
    password: ENV['MAIL_PW'],
    authentication: :plain,
    enable_starttls_auto: true
}

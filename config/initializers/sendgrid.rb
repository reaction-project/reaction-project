sendgrid_enabled = %w(
  SENDGRID_USERNAME
  SENDGRID_PASSWORD
).all? { |key| ENV.key? key }

if sendgrid_enabled
  ActionMailer::Base.smtp_settings = {
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: 'reaction-project.org',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end

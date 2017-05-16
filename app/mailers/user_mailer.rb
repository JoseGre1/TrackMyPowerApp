class UserMailer < ApplicationMailer
  default from: 'service@track-mypower.tk'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'http://track-mypower.tk/login'
    mg_client = Mailgun::Client.new ENV['api_key']
    html_output = render_to_string template: "user_mailer/welcome_email"
    message_params = {:from    => ENV['username'],
                      :to      => @user.email,
                      :subject => 'Welcome to track-mypower.tk (Power Tracking Services)',
                      :html    => html_output.to_str,
                      :inline  => File.new("#{Rails.root}/app/assets/images/marker.png") }
    mg_client.send_message ENV['domain'], message_params
  end

  def new_notification(user, notification)
      @user = user
      @notification = notification
      @url  = "http://track-mypower.tk/users/#{@user.username}/alerts"
      mg_client = Mailgun::Client.new ENV['api_key']
      html_output = render_to_string template: "user_mailer/new_notification"
      message_params = {:from    => ENV['username'],
                        :to      => @user.email,
                        :subject => 'You have new notifications (track-mypower.tk)',
                        :html    => html_output.to_str ,
                        :inline  => File.new("#{Rails.root}/app/assets/images/marker.png") }
      sent_mess = mg_client.send_message ENV['domain'], message_params
  end
end

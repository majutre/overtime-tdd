class ManagerMailer < ApplicationMailer
  def daily_overtime_email(manager)
    @manager = manager
    mail(to: @manager.email, subject: 'Daily Overtime Request E-mail')
  end
end

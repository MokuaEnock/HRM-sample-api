class UserMailer < ApplicationMailer

  def new_employee_email
      @eployee = params[:employee]
      mail(to: @employee.email, subject: 'Your new account details')
  end
end

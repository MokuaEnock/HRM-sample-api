class UsersController < ApplicationController
  def create_employee
  @employer = Employer.find(params[:employer_id])
  @employee = @employer.employees.create(user_params)
    if @employee.save
      UserMailer.with(employer: employee).new_employee_email.deliver_now
      render json: {employee: @employee, status: :created}
    else
      render json: @employee.errors, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

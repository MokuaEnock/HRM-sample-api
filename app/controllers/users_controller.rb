class UsersController < ApplicationController
  include Authenticatable

  before_action :authenticate_user!, except: [:create]

  def create
    @user = User.new(user_params)
    @user.roles << Role.find_by(name: "employee")
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { error: "Failed to create user" }, status: :unprocessable_entity
    end
  end

  def index
    if current_user.has_role?(:admin)
      render json: { users: User.all }
    else
      render json: { error: "You do not have permission to do that" }, status: :forbidden
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

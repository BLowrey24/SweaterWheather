class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    render json: UserSerializer.creation(user), status: 201
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
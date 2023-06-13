class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      user = User.create!(user_params)
      render json: UserSerializer.creation(user), status: 201
    else
      render json: ErrorSerializer.serialize("Your passwords do not match"), status: 400
    end
  end

  private 

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
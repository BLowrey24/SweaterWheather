class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.creation(user), status: 200
    else
      render json: ErrorSerializer.serialize("Invalid credentials"), status: 400
    end
  end
end
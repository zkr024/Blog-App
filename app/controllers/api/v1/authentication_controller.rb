class Api::V1::AuthenticationController < ApplicationController
  def login
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])
      render json: @user.as_json(only: [:id, :name, :email]), status: :created
    else
      head(:unauthorized)
    end
  end
end
class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: { messages: @user.errors }, status: 422
    end
  end

  def favorite_city
    if current_user.update(favorite_city: params[:favorite_city])
      render json: current_user
    else
      render json: { messages: current_user.errors }, status: 422
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:email, :password)
  end
end

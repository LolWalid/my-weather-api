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

  def update
    #
  end

  def show
    render json: { id: current_user.id }
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:email, :password, :favorite_city)
  end
end

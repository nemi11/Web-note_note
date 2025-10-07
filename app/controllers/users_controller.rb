# frozen_string_literal: true

class UsersController < ApplicationController
  layout "users", only: [:new, :create]

  def new
    @user = User.new
  end

 def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "登録できました"
      redirect_to root_path
    else
      flash[:alert] = "登録できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

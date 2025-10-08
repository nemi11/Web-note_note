# frozen_string_literal: true

class UsersController < ApplicationController
  layout "users", only: [:new, :create]

  def new
    @user = User.new
  end

 if @user.save
  flash[:notice] = "登録できました"
  redirect_to root_path
else
  flash.now[:alert] = "登録できませんでした"
  render :new, status: :unprocessable_entity
end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

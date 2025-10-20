class UsersController < ApplicationController
def show
  if params[:id] == "sign_out"
    redirect_to root_path and return
  end
  @user = User.find(params[:id])
end
end
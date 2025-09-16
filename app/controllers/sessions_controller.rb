class SessionsController < ApplicationController
  layout "login", only: [:new]

  def new
    # ログインフォーム表示
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインしました"
      redirect_to root_path
    else
      flash.now[:alert] = "メールアドレスかパスワードが間違っています"
      render :new, layout: "login"
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end
end

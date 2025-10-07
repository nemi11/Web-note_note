class SessionsController < ApplicationController
  layout "login", only: [:new]

  def new
    # ログインフォーム表示
  end

  def create
    user = User.find_by(email: params[:email].downcase)

  if user&.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  else
    flash.now[:alert] = "メールアドレスまたはパスワードが間違っています"
    render :new, layout: "login", status: :unprocessable_entity
  end
end


  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "ログアウトしました"
  end
end

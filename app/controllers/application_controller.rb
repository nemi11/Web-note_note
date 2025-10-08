# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Devise: ログイン後のリダイレクト先を指定
  def after_sign_in_path_for(resource)
    home_path # ここをログイン後に見せたいページのパスに変更
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

   protected

  def layout_by_resource
    if devise_controller?
      "devise" # ← ねみさんのレイアウトを使う
    else
      "application"
    end
  end

end

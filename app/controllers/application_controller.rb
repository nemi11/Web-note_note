class ApplicationController < ActionController::Base
  # 登録成功後にトップページに戻る
  def after_sign_up_path_for(resource)
    root_path
  end

  # ログイン成功後
  def after_sign_in_path_for(resource)
    root_path
  end

  # ログアウト後にトップページに戻る
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end


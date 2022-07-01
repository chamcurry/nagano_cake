class ApplicationController < ActionController::Base

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end
# 会員が新規登録したリダイレクト先をマイページに遷移したい
  # def after_sign_up_path_for(_resource)
  #   if resource != :admin
  #     customers_my_page_path
  #   end
  # end
end
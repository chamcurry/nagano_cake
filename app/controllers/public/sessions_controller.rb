# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  # 退会しているか判断するためのメソッド
  def configure_sign_in_params
    # [処理内容１]入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    # アカウントが取得できない場合、このメソッドを終了する
    return if !@customer
    # [処理内容２]取得したアカウントのパスワードと入力されたパスワードが一致しているか判別
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_active == true
      # [処理内容３]is_activeの値がtrueだった場合、サインアップ画面に遷移させる
       redirect_to new_customer_registration_path
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top,:about,:index,:show]
  # before_action :authenticate_admin!, only: [:top]

  def after_sign_out_path_for(resource)
    root_path
  end
end
class ApplicationController < ActionController::Base
  before_action :login_required

  private

  def login_required
    redirect_to new_user_session_path unless current_user
  end
end

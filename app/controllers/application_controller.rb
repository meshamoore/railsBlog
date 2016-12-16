class ApplicationController < ActionController::Base

  include ApplicationHelper

  protect_from_forgery with: :exception

  protected

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def confirm_logged_in
      unless current_user
        flash[:notice] = 'Please log in!'
        redirect_to(login_path)
      end
    end
end
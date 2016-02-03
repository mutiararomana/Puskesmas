module SessionsHelper
    def log_in(admin)
        session[:admin_id] = admin.id
  end
    # Returns the current logged-in admin (if any).
    def current_admin
        @current_admin ||= Admin.find_by(id: session[:admin_id])
  end
    # Returns true if the admin is logged in, false otherwise.
  def logged_in?
      !current_admin.nil?
  end
    # Logs out the current admin.
  def log_out
      session.delete(:admin_id)
      @current_admin = nil
  end

end

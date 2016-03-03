class SessionsController < ApplicationController
  def new
      if logged_in?
          redirect_to home_path
      else
          render 'new'
      end
  end

  def create
      admin = Admin.find_by(username: params[:session][:username].downcase)
      if admin && admin.authenticate(params[:session][:password])
          log_in admin
          redirect_to home_path

        else
          flash.now[:alert] = 'Invalid email/password combination'
            render 'new'
        end
  end

  def destroy
    log_out
      redirect_to login_path
  end
end

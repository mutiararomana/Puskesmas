class SessionsController < ApplicationController
  def new
  end

  def create
      admin = Admin.find_by(email: params[:session][:username].downcase)
      if admin && admin.authenticate(params[:session][:password])
          log_in admin
      redirect_to root_path

    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

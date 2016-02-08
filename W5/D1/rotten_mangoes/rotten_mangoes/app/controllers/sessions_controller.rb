class SessionsController < ApplicationController
  def new
  end

  def create
    prof = Professor.find_by(email: params[:email])
    if prof && prof.authenticate(params[:password])
      session[:prof_id] = prof.id
      # if prof.admin
      #   redirect_to admin_users_path, notice: "Welcome to the admin page, #{user.full_name}"
      # else
        redirect_to '/professor',notice: "Welcome back, #{prof.email}!"
      # end
    else
      render :new
    end
  end

  def back_to_admin
    session[:user_id] = session[:me]
    session[:me] = nil
    redirect_to admin_users_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Adios!"
  end
  
end

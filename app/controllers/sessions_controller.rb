class SessionsController < ApplicationController
  def new
    redirect_to '/auth/google'
  end

  def create
    user = FindOrCreateUser.new(request.env['omniauth.auth']).user
    log_in_as(user) if user
    redirect_to root_path
  end

  def delete
    log_out
    redirect_to root_path
  end
end

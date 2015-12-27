class UsersController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Registered successfully"
      redirect_to(:action => 'index')
    else
      # IF save fails, redisply the form so user can fix problems.
      flash[:notice] = "Something went wrong"
      render('new')
    end
  end
  
end

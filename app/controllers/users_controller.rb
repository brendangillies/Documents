
class UsersController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create 
    @user = User.new()
    if @user.save
      flash(:notice => "Account Created Successfully")
      redirect_to(:action => 'index')
    else
      # IF save fails, redisply the form so user can fix problems.
      flash(:notice => "Something went wrong")
      render('new')
    end
  end
  
end

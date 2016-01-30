
class UsersController < ApplicationController
  
  def index
  end

  def show
	  @user = User.find(params[:id])
  end
  
	def new
		@user = User.new
	end
  def create 
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Registered successfully"
			redirect_to @user 
    else
      # IF save fails, redisply the form so user can fix problems.
      flash[:notice] = "Something went wrong"
      render('new')
    end
  end

	private

		def user_params
			params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
		end
end

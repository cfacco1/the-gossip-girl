class SessionsController < ApplicationController
    def new
    	@user = User.new
  	end

  	def create
    	@user = User.find_by(email: params[:email])
    		if @user && @user.authenticate(params[:password])
      			session[:user_id] = @user.id
      			puts "Login is OK!"
      			flash[:success] = "Connected !"
      			redirect_to gossips_path
    		else
    			flash[:danger] = 'Invalid email/password combination'
      			render 'new'
   			end
   	end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You've been deconnected. XOXO"
    redirect_to root_path
  end

end

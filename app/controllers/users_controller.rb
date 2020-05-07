require 'bcrypt'

class UsersController < ApplicationController
  
 def new
    @user = User.new
  end

    def create
     
      @user = User.create(first_name: params[:first_name], email: params[:email], password: params[:password], city_id: City.all.sample.id)
  
      if @user.save
        log_in(@user)
        redirect_to root_path
      else
        render 'new'
        puts params
      end
    end

  def destroy
    session.delete(current_user.id)
    session[:user_id] = nil
    puts "XOXO, see you soon!"
    flash[:notice] = "Disconnected !"
    redirect_to '/l'
  end

  def edit
  end

  def index
  end

  def show
        @user = User.find(params[:id])
  end

  def update
  end

end

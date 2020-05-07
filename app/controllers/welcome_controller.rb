class WelcomeController < ApplicationController
  
  def home
  	puts "*" * 50
    puts params[:user_name]
    puts "*" * 50
  end
  
end

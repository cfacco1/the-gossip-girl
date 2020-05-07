class CitiesController < ApplicationController
  def index
    @city = City.all
  end

  def new
    @city = City.new
  end

  def show
    @city = City.find(params[:id])
    @cities_users  = []
    @cities_users = User.where(city_id: params[:id])
    @gossips_users = Gossip.where(user_id: @cities_users[1])
    @cities_users.each do |i| 
      print i
      puts @gossips_users.where(user_id: i.id)
  	end
  end

end

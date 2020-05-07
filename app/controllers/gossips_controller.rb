class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

def index
    @gossips = Gossip.all
  end

def new
  @gossip= Gossip.new
end

def show
    @gossip = Gossip.find(params[:id])
  end

def edit
    @gossip = Gossip.find(params[:id])
    if current_user == @gossip.user
    else
      flash[:danger] = "You're not the author of this gossip"
      redirect_to new_session_path
    end
end

def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update('title' => params[:title], 'content' => params[:content], 'user_id' => @gossip.user_id)
      flash[:success] = "Gossip modified !"
      redirect_to @gossip
    else
      flash[:notice] = "You've made mistakes...You've made massive, heartbreaking mistakes "
      render :edit
    end
end

def create
  @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'user_id' => current_user.id)
  @gossip.user = current_user
  if @gossip.save
    flash[:success] = "There's only one queen bitch in this town and that's me"
    redirect_to @gossip
  else
    render :new
  end
end

  def destroy
    @gossip = Gossip.find(params[:id])
    if current_user == @gossip.user
      @gossip.destroy
      flash[:sucess] = "Deleted Gossip!"
      redirect_to gossips_path
    else
      flash[:danger] = "Did not write it, cannot delete it, SORRY"
      redirect_to new_session_path
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in"
      redirect_to new_session_path
    end
  end
end

class GossipsController < ApplicationController
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
  end

def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)
    redirect_to gossips_path
end

def create
  @gossip = Gossip.new(title: params[:title], content: params[:content],  user: User.find(params[:user]))
  if @gossip.save
    redirect_to gossips_path
  else
    render 'new'
  end
end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title,:content)
  end
end

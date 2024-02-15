class WelcomeController < ApplicationController

  
  def index
    @user = User.last
    @gossip = Gossip.new
    @gossips = Gossip.all
  end

  def index_post
    user = User.new
    user.first_name = params["first_name"]
    user.last_name = params["last_name"]
    user.save

    # Redirection vers la page d'accueil
    redirect_to root_path
  end
end

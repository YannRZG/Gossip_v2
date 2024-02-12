class WelcomeController < ApplicationController
  def index
    @user = UserTest.last
    @gossips = Gossip.all
  end

  def index_post
    user = UserTest.new
    user.first_name = params["first_name"]
    user.last_name = params["last_name"]
    user.save

    # Redirection vers la page d'accueil
    redirect_to root_path
  end
end

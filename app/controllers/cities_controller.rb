class CitiesController < ApplicationController
  def show    
    @city = City.find(params[:id])
    @user = User.where(city: @city)
    @gossips = Gossip.joins(:user).where(users: { id: @user.pluck(:id) })
    
  end
end

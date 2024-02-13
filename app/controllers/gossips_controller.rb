class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
  
  def new
    @gossip = Gossip.new
  end

  def create
    # @gossip = current_user.gossips.build(gossip_params)
    user = User.all.first
    @gossip = Gossip.new(user: user, title: params[:title], content: params[:content])
     
    if @gossip.save
      redirect_to root_path, notice: 'Gossip was successfully created.'
    else
      render :new
    end
  end

end

#   def edit
#     @gossip = Gossip.find(params[:id])
#   end

#   def update
#     @gossip = Gossip.find(params[:id])
#     if @gossip.update(gossip_params)
#       redirect_to @gossip, notice: 'Gossip was successfully updated.'
#     else
#       render :edit
#     end
#   end

#   def destroy
#     @gossip = Gossip.find(params[:id])
#     @gossip.destroy
#     redirect_to gossips_url, notice: 'Gossip was successfully destroyed.'
#   end

#   private
#   def gossip_params
#     params.permit(:first_name, :last_name, :email, :location, :message)
#   end
# end

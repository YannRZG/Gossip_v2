class CommentsController < ApplicationController
    
 def create
  @gossip = Gossip.find(params[:id])    
    @comment = Comment.new( 
      content: params['content'])

    if @comment.save
      redirect_to gossip_path(@gossip)
    else
      render "new"
    end
    
  end 


  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end


  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    
    if @comment.update(content: params['content'])
      redirect_to gossip_path(@gossip), notice: 'Comment was successfully updated.'
    else
      render "edit"
    end
  end

  

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossips_path, notice: 'Comment was successfully destroyed.'
  end

private

  def post_params
    post_params = params.permit(:content)
  end
  
end

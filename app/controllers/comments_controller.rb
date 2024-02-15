class CommentsController < ApplicationController
    
  def show
    @comment = Comment.find(params[:id])
  end
  

  def new 
    @comment = Comment.new 
  end


  def edit
    @comment = Comment.find(params[:id])
  end


  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update(post_params)
      redirect_to gossip_path(@comment.gossip), notice: 'Comment was successfully updated.'
    else
      render "edit"
    end
  end

  def create    
    @comment = Comment.new( 
      content: params['content'])

    if @comment.save
      redirect_to gossips_path
    else
      render "new"
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

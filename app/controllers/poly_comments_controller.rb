class PolyCommentsController < ApplicationController
  before_action :find_poly_comment , only: [:show , :edit, :update, :destroy]
  
  # show all data
  def index 
    @poly_comment1 = PolyComment.all.order('created_at ASC')
  end
  
  # show form
  def new
    @poly_comment = PolyComment.new
  end

  #process new
  def create
    commentable_type = poly_comment_params[:commentable_type]
    id = params["#{commentable_type.underscore}_id"]
    @poly_comment = PolyComment.new(poly_comment_params)
    @poly_comment.user_id = current_user.id
    @poly_comment.commentable_id = id
    
    if @poly_comment.save
      if @poly_comment.commentable_type == 'DiscussionTopic'        
        redirect_to campaign_discussion_topic_path(@poly_comment.commentable.campaign.id, @poly_comment.commentable.id )
      else
        redirect_to @poly_comment.commentable
      end
      
    else
      render 'new'
    end
  end
  #show particular data
  def show
  end

  # show form for edit
  def edit
  end

  # process editing
  def update
    if @poly_comment.update(poly_comment_params) 
      redirect_to @poly_comment
    else
      render 'new'
    end
  end
  
  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @poly_comment.destroy

    if @poly_comment.commentable_type == 'DiscussionTopic'
      redirect_to campaign_discussion_topic_path(@poly_comment.commentable.campaign.id, @poly_comment.commentable.id )

    else
      redirect_to campaign_path(@campaign)
    end   
  end

  private
  
  def poly_comment_params
    params.require(:poly_comment).permit(:title , :commentable_id , :commentable_type , :user_id )
  end 
  
  def find_poly_comment
    @poly_comment=PolyComment.find(params[:id])
  end

end

class DiscussionTopicsController < ApplicationController
  before_action :find_discussion_topic , only: [:show , :edit, :update, :destroy]
  
  # show all data
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @discussion_topic = @campaign.discussion_topics
  end
  
  # show form
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @discussion_topic = @campaign.discussion_topics.build
  end

  #process new
  def create
    @campaign = Campaign.find(params[:campaign_id])
    
    if can? :create , DiscussionTopic
      
    @discussion_topic = DiscussionTopic.new(discussion_topic_params)
      @discussion_topic.novice_user_id = current_user.id
      @discussion_topic.campaign_id = @campaign.id
      if @discussion_topic.save
        redirect_to campaign_discussion_topics_url(@campaign)
      else
        render 'new'
      end
    else
      flash[:notice] = "you are not authorized."
    end

  end
  
  #show particular data
  def show
    @campaign = Campaign.find(params[:campaign_id])
    
  end

  # show form for edit
  def edit
    @campaign = Campaign.find(params[:campaign_id])
  end

  # process editing
  def update
    @campaign = Campaign.find(params[:campaign_id])
    if @discussion_topic.update(discussion_topic_params) 
      redirect_to campaign_discussion_topic_path(@campaign)
    else
      render 'new'
    end
  end
  
  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @discussion_topic = @campaign.discussion_topics.find(params[:id])
    @discussion_topic.destroy
    redirect_to campaign_discussion_topics_path(@campaign , @discussion_topic)
  end
  
  private 
  
  def discussion_topic_params
    params.require(:discussion_topic).permit(:title , :novice_user_id , :campaign_id )
  end 
  
  def find_discussion_topic
    @discussion_topic=DiscussionTopic.find(params[:id])
  end

end
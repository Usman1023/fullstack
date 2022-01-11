class CampaignsController < ApplicationController
  
  before_action :find_campaign , only: [:show , :edit, :update, :destroy]
  
  # show all data
  def index 
    @campaign=Campaign.all.order('created_at ASC')
  end
  
  # show form
  def new
    @campaign = Campaign.new
  end
  
  #process new
  def create
    if can? :create , Campaign
      @campaign = Campaign.new(campaign_params)
      @campaign.expert_user_id = current_user.id
      if @campaign.save
        redirect_to @campaign ,notice: 'campaign was successfully created.'
        # if we want to redirect to edit page
        #redirect_to [:edit, @campaign] 
      else
        render 'new'
      end
    else
      flash[:notice] = "you are not authorized."
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
    if @campaign.update(campaign_params) 
      #redirect_to [:edit, @campaign] 
      redirect_to @campaign
    else
      render 'new'
    end
  end
  
  def destroy
    if @campaign.destroy 
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  
  def campaign_params
    params.require(:campaign).permit(:title, :purpose , :estimated_duration)
  end 
  
  def find_campaign
    @campaign=Campaign.find(params[:id])
  end

end

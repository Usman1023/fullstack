class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.type == 'ExpertUser'
        #CAMPAIGN
        can [:read, :create] , Campaign

        can :update, Campaign do |campaign|
          campaign.expert_user == user
        end

        can :destroy, Campaign do |campaign|
          campaign.expert_user == user
        end
        
        #DISCUSSION_TOPIC
        can :read, DiscussionTopic

        #POLY_COMMENT
        can [:create , :read] , PolyComment

        can :update, PolyComment do |comment|
          comment.user_id == user.id
        end

        can :destroy, PolyComment do |comment|
          comment.user_id == user.id
        end
          
      elsif user.type == 'NoviceUser'
        #Discussion_Topic
        can [:read, :create] , DiscussionTopic 

        can :update, DiscussionTopic do |discussion_topic|
          discussion_topic.novice_user == user
        end

        can :destroy, DiscussionTopic do |discussion_topic|
          discussion_topic.novice_user == user
        end
        
        #Campaign
        can :read, Campaign

        #POLY_COMMENT
        can [:create , :read ] , PolyComment

        can :update, PolyComment do |comment|
          comment.user_id == user.id
        end

        can :destroy, PolyComment do |comment|
          comment.user_id == user.id
        end
      end
    else
      can :read, :sign_up
    end
  end
end

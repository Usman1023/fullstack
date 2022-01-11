class ExpertUser < User
    has_many :campaigns, dependent: :destroy
end

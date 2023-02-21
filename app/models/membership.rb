class Membership < ApplicationRecord
    validates :client_id, uniqueness: true
    validates :gym_id, uniqueness: true

    belongs_to :client
    belongs_to :gym
end

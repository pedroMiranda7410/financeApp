class Earning < ApplicationRecord
    belongs_to :user
    belongs_to :movement_type
    belongs_to :sub_type
end

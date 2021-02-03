class SubType < ApplicationRecord
    belongs_to :movement_type
    has_many :earnings, dependent: :delete_all
    has_many :expenses, dependent: :delete_all
end

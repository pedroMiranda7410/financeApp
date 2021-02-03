class MovementType < ApplicationRecord
    belongs_to :user
    has_many :earnings, dependent: :delete_all
    has_many :expenses, dependent: :delete_all
    has_many :sub_types, dependent: :delete_all
end

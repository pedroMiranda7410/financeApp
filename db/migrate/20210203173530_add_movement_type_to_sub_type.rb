class AddMovementTypeToSubType < ActiveRecord::Migration[5.2]
  def change
    add_reference :sub_types, :movement_type, foreign_key: true
  end
end

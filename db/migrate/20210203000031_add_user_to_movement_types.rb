class AddUserToMovementTypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :movement_types, :user, foreign_key: true
  end
end

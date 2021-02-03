class AddMovementTypeToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses, :movement_type, foreign_key: true
  end
end

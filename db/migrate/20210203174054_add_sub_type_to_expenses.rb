class AddSubTypeToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses, :sub_type, foreign_key: true
  end
end

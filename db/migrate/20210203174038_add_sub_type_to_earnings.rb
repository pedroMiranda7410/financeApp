class AddSubTypeToEarnings < ActiveRecord::Migration[5.2]
  def change
    add_reference :earnings, :sub_type, foreign_key: true
  end
end

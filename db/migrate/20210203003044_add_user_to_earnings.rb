class AddUserToEarnings < ActiveRecord::Migration[5.2]
  def change
    add_reference :earnings, :user, foreign_key: true
  end
end

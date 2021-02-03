class CreateEarnings < ActiveRecord::Migration[5.2]
  def change
    create_table :earnings do |t|
      t.string :title, null: false, default: ''
      t.datetime :date, null: false, default: Date.today      
      t.float :value, null: false, default: 0.0
      t.string :description, null: false, default: ''
      t.timestamps
    end
  end
end

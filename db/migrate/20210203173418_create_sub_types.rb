class CreateSubTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_types do |t|
      t.string :title, null:false, default: ''
      t.string :color, null:false, default: '#000000'
      t.timestamps
    end
  end
end

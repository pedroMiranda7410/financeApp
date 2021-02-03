class CreateMovementTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :movement_types do |t|
      t.string :title, null:false, default: ''
      t.string :color, null:false, default: '#000000'
      t.string :pointer_type, null:false, default: 'ganho'
      t.timestamps
    end
  end
end

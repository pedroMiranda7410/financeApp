class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean :individual, null:false, default: true
      t.string :name, null:false, default: ''
      t.string :cpf, null:false, default: ''
      t.string :email, null:false, default: ''
      t.string :phone, null:false, default: ''
      t.string :password_digest, null:false, default: ''
      t.string :birthdate, null:false, default: ''
      t.timestamps
    end
  end
end

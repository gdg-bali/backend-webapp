class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar_url
      t.string :public_id
      t.string :phone
      t.string :institution
      t.integer :roles_mask

      t.timestamps
    end
  end
end

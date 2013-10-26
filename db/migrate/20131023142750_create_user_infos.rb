class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :name
      t.boolean :gender
      t.string :location
      t.text :self_description
      t.integer :age
      t.references :user, index: true

      t.timestamps
    end
  end
end

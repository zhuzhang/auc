class AddBirthdayToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :birthday, :date
  end
end

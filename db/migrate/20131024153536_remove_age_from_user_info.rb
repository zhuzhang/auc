class RemoveAgeFromUserInfo < ActiveRecord::Migration
  def change
    remove_column :user_infos, :age, :integer
  end
end

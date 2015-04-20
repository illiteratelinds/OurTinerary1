class ChangeColumnForFriendships < ActiveRecord::Migration
  def change
    change_column :friendships, :status, :boolean
  end
end

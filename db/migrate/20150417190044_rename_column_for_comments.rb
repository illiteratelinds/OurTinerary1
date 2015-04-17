class RenameColumnForComments < ActiveRecord::Migration
  def change
    rename_column :comments, :discussion_id, :commentable_id
    rename_column :comments, :discussion_type, :commentable_type
  end
end

class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.belongs_to :user
      t.references :wishlistable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end

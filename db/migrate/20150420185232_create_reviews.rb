class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, index: true
      t.integer :rating
      t.text :content
      t.belongs_to :creator
      t.timestamps null: false
    end
  end
end

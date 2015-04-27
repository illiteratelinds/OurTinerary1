class CreateItineraryItems < ActiveRecord::Migration
  def change
    create_table :itinerary_items do |t|
      t.belongs_to :itinerary
      t.references :itemable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end

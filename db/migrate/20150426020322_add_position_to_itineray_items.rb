class AddPositionToItinerayItems < ActiveRecord::Migration
  def change
    add_column :itinerary_items, :position, :integer, default: 0
  end
end

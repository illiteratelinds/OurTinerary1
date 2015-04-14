class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :itinerary
      t.belongs_to :hotel
      t.timestamps null: false
    end
  end
end

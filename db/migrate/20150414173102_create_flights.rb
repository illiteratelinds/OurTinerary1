class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline
      t.datetime :date
      t.string :origin
      t.string :destination
      t.text :review
      t.belongs_to :itinerary
      t.timestamps null: false
    end
  end
end

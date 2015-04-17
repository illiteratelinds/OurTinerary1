class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.belongs_to :itinerary
      t.belongs_to :restaurant
      t.datetime :date
      t.timestamps null: false
    end
  end
end

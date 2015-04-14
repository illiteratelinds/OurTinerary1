class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :title
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end

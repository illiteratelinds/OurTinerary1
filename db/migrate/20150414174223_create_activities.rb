class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :itinerary
      t.belongs_to :attraction
      t.datetime :date
      t.timestamps null: false
    end
  end
end

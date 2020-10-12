class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :trip_name
      t.text :itinerary
      t.string :start_date
      t.string :end_date
      t.text  :notes
      t.integer :user_id
    end 
  end
end

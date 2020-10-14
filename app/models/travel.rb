class Travel < ActiveRecord::Base
    belongs_to :user
    # validates :trip_name, :itinerary, :start_date, :end_date, :notes, presence: true
end 
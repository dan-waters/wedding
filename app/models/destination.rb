class Destination < ActiveRecord::Base
  belongs_to :honeymoon
  validates_presence_of :name, :arrival_date, :departure_date
end

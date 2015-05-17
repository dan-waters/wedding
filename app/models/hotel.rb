class Hotel < ActiveRecord::Base
  belongs_to :destination
  validates_presence_of :name, :url
end

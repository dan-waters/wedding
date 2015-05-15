class Honeymoon < ActiveRecord::Base
  acts_as_singleton

  has_many :destinations
end

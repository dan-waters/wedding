class Guest < ActiveRecord::Base
  belongs_to :guest_type
end
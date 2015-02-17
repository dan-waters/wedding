class Payment < ActiveRecord::Base
  belongs_to :item
  belongs_to :person
  default_scope { order(amount: :desc)}
end

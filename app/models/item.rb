class Item < ActiveRecord::Base
  has_many :payments
  has_many :people, through: :payments


  def self.find_by_param(param)
    find_by(name: param)
  end

  def to_param
    self.name
  end

  def to_s
    self.name
  end
end

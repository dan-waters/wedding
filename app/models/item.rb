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

  def balance
    payments.map(&:amount).sum - price
  end

  def paid?
    balance > 0
  end
end

class Item < ActiveRecord::Base
  has_many :payments, dependent: :destroy
  has_many :people, through: :payments
  default_scope { order(:name) }
  scope :booked, -> { where(booked: true) }
  scope :not_booked, -> { where(booked: false) }

  def self.find_by_param(param)
    find_by!(name: param)
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
    balance >= 0
  end
end

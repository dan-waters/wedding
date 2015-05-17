class Item < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :payments, dependent: :destroy
  has_many :people, through: :payments
  default_scope { order(:name) }
  scope :booked, -> { where(booked: true) }
  scope :not_booked, -> { where(booked: false) }

  def balance
    payments.map(&:amount).sum - price
  end

  def paid?
    balance >= 0
  end
end

class Person < ActiveRecord::Base
  has_many :payments, dependent: :destroy
  has_many :items, through: :payments
  default_scope { order(:name) }

  def self.find_by_param(param)
    find_by!(name: param)
  end

  def to_param
    self.name
  end

  def to_s
    self.name
  end
end

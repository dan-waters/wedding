class Destination < ActiveRecord::Base
  belongs_to :honeymoon
  has_one :hotel
  validates_presence_of :name, :arrival_date, :departure_date
  validate :dates_do_not_overlap, :dates_inside_honeymoon_range

  default_scope { order(:arrival_date) }

  private

  def dates_do_not_overlap
    if Destination.any?{|dest| dest != self && dest.arrival_date < arrival_date && dest.departure_date > arrival_date}
      errors.add(:arrival_date, 'must not overlap with another destination')
    end
    if Destination.any?{|dest| dest != self && dest.arrival_date < departure_date && dest.departure_date > departure_date}
      errors.add(:departure_date, 'must not overlap with another destination')
    end
  end

  def dates_inside_honeymoon_range
    if arrival_date < Honeymoon.instance.from
      errors.add(:arrival_date, 'must be after honeymoon has begun')
    end

    if departure_date > Honeymoon.instance.to
      errors.add(:departure_date, 'must be before honeymoon has ended')
    end
  end
end

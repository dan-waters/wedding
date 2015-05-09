class FullDayGuest < Guest
  def self.select_options
    ['All Day', self.name]
  end

  def humanize
    'All Day'
  end
end
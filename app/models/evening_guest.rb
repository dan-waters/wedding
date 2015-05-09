class EveningGuest < Guest
  def self.select_options
    ['Evening Only', self.name]
  end

  def humanize
    'Evening Only'
  end
end
class FullDayGuest < Guest; end
class EveningGuest < Guest; end

class MoveGuestTypes < ActiveRecord::Migration
  def up
    add_column :guests, :guest_type_id, :integer
    add_foreign_key :guest, :guest_types

    all_day = GuestType.create!(description: 'All Day')
    evening = GuestType.create!(description: 'Evening Only')

    Guest.all.each do |guest|
      guest.guest_type = (guest.type == 'FullDayGuest' ? all_day : evening)
      guest.save!
    end

    remove_column :guests, :type
  end

  def down
    add_column :guests, :type, :string

    Guest.all.each do |guest|
      if guest.guest_type.description == 'All Day'
        guest.becomes(FullDayGuest)
      else
        guest.becomes(EveningGuest)
      end
      guest.save!
    end
    GuestType.delete_all

    remove_foreign_key :guest, :guest_types
    remove_column :guests, :guest_type_id
  end
end

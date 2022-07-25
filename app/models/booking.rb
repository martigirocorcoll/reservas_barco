class Booking < ApplicationRecord

  def self.total_eolo
    total = 0
    Booking.all.each do |booking|
      if booking.barco == "eolo" && booking.preunet != nil
         total = total + booking.preunet
      end
    end
    return total
  end

  def self.total_barqa
    total = 0
    Booking.all.each do |booking|
      if booking.barco == "barqa" && booking.preunet != nil
        total = total + booking.preunet
      end
    end
    return total
  end

  def self.total
    return Booking.total_barqa + Booking.total_eolo
  end

end

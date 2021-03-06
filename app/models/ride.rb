class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    else
       lets_ride
    end
  end

  def lets_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
     new_nausea = self.user.nausea + self.attraction.nausea_rating
     new_tickets =  self.user.tickets - self.attraction.tickets
     self.user.update(
       :happiness => new_happiness,
       :nausea => new_nausea,
       :tickets => new_tickets
     )
     "Thanks for riding the #{self.attraction.name}!"
  end

end

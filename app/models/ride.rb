
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user = User.find(self.user_id)
    @attraction = Attraction.find(self.attraction_id)
    ticket_limit = @user.tickets < @attraction.tickets
    height_limit = @user.height < @attraction.min_height

    if ticket_limit && height_limit
      "Sorry. You do not have enough tickets the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif ticket_limit
      "Sorry. You do not have enough tickets the #{@attraction.name}."
    elsif height_limit
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      @user.update(
        :tickets => (@user.tickets - @attraction.tickets),
        :nausea => (@user.nausea + @attraction.nausea_rating),
        :happiness => (@user.happiness + @attraction.happiness_rating),
        )
      "Thanks for riding the #{@attraction.name}!"
    end
  end

end

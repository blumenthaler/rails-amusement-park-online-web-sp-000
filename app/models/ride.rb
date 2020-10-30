class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        user = self.user
        attraction = self.attraction
        too_short = "You are not tall enough to ride the #{attraction.name}."
        need_tix = "You do not have enough tickets to ride the #{attraction.name}."
        errors = ["Sorry."]
    
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            errors << need_tix
            errors << too_short
            error_msg = errors.join(" ")
        elsif user.tickets < attraction.tickets
            errors << need_tix
            error_msg = errors.join(" ")
        elsif user.height < attraction.min_height
            errors << too_short
            error_msg = errors.join(" ")
        else
            user.update(
                tickets: user.tickets -= attraction.tickets,
                nausea: user.nausea += attraction.nausea_rating,
                happiness: user.happiness += attraction.happiness_rating
            )
            msg = "Thanks for riding the #{attraction.name}!"
        end
    end
end
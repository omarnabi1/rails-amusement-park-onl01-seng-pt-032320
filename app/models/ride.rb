class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    

    def not_enough_tickets
        "You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def not_tall
        "You are not tall enough to ride the #{self.attraction.name}."
    end
    
    def requirements
        is_tall, has_enough_tickets = false
        
        if self.user.height >= self.attraction.min_height
            is_tall = true
        end

        if self.user.tickets >= self.attraction.tickets
            has_enough_tickets = true
        end

        return [is_tall, has_enough_tickets]

    end

    def stat_updates
        
        new_tix = self.user.tickets - self.attraction.tickets
        new_nau = self.user.nausea + self.attraction.nausea_rating
        new_hap = self.user.happiness + self.attraction.happiness_rating
        self.user.update(
            :tickets => new_tix, 
            :nausea => new_nau,
            :happiness => new_hap,
        )
        "Thanks for riding the #{self.attraction.name}!"
    end


    def take_ride
        tall_enough, sufficient_tix = requirements
        if tall_enough && sufficient_tix
            stat_updates
        elsif !tall_enough && sufficient_tix
            "Sorry. " + not_tall
        elsif !sufficient_tix && tall_enough
            "Sorry. " + not_enough_tickets
        else
            "Sorry. " + not_enough_tickets + ' ' + not_tall
            
        end
   
    end

end
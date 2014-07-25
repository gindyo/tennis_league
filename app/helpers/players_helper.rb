module PlayersHelper
  class PlayerViewModel
    attr_accessor :player
    def initialize player = nil
      self.player = (player || NilPlayer.new)
    end

    def url
      return "/players/#{ player.id}" if not  player.is_nil
      return "/players/new"
    end
    def name
       player.name || "Anonymous"
    end
 
    def home_court_name
      return  player.home_court.name if player.home_court
      "Click here to set you home court"
    end
    def home_court_url
       player.home_court || "/players/#{player.id}/edit"
    end
    def method_missing meth
      return  player.send meth  
    end
  end
end

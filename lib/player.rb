class Player
    attr_accessor :name, :hitpoints

    def initialize(name, hitpoints = 100)
        @name = name
        @hitpoints = hitpoints
    end
    
end
class Films

    attr_accessor :title, :director, :description

    @@all = []

    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

end

class Character

    @@all = []

    attr_accessor :name, :url, :films, :gender, :age, :hair_color

    def initialize(person)
        self.name = person[:name]
        self.url = person[:url]
        @@all << self
    end

    def self.all
        @@all
    end

end

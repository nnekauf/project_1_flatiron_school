class Word
    attr_accessor :name, :syns, :ants, :related_words, :short_def

    @@all =[]
    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value)
        end
        @@all << self
    end

end
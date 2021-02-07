class Word
    attr_accessor :name, :syns, :ants, :related_words, :short_def, :word

    @@all =[]

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end
    def self.find_by_word(word_choice)
        self.all.find {|ele| ele.word == word_choice}
    end
end
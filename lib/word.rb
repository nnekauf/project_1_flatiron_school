class Word
    attr_accessor :name, :syns, :ants, :related_words, :short_def

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value)
        end
        
    end

end
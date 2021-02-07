require "pry"
class Api
    #  Key (Thesaurus): 299e3474-8d57-473c-836c-9e5c31d32f6e
    # Key (Dictionary): 85a434fc-3a5d-48df-a8e0-35b0c5bd54ee

    def self.get_thesaurus_by_word(word)
        url = "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/#{word}?key=299e3474-8d57-473c-836c-9e5c31d32f6e"
        response = HTTParty.get(url)
        @main_hash = response[0] 
        
        if response.empty? 
            return false
        elsif @main_hash["meta"]["id"].to_s != "#{word}"
            return false
        end
#binding.pry
        name_hash = { } 
        name_hash[:name] = @main_hash["meta"]["id"]

        if @main_hash["def"][0]["sseq"][0][0][1].flatten.include?("rel_list")
            rel_words = []
            @main_hash["def"][0]["sseq"][0][0][1]["rel_list"].each do |array| 
                array.each{|hash| hash.each {|key,value| rel_words << "#{value}"}}
            end
            name_hash[:related_words] =  rel_words.join(", ")
        else 
            name_hash[:related_words] = "We're sorry! We couldn't find any related words."
        end

        if @main_hash["meta"].flatten.include?("syns")
            syn_words = []
            @main_hash["meta"]["syns"].each do |array|
                array.each{|word| syn_words << word}
            end
            name_hash[:syns] = syn_words.join(", ")
        else
            name_hash[:syns] = "We're sorry! We couldn't find any synonyms."
        end

        if @main_hash["meta"].flatten.include?("ants")
            ant_words = []
            @main_hash["meta"]["ants"].each do |word| #
            ant_words << word
            end
            name_hash[:ants] = ant_words.join(", ")
        else
            name_hash[:ants] = "We're sorry! We couldn't find any antonyms."
        end

        if @main_hash.flatten.include?("shortdef")
            name_hash[:short_def] = @main_hash["shortdef"][0]
        else
            name_hash[:short_def] = "We're sorry! We couldn't find any definitions."
        end

        name_hash.each do |key, value|
            if value == "" || value == " "
                value = "We're sorry! Seems like this word may not have any!"
            end
        end
        Word.new(name_hash)
    end

end

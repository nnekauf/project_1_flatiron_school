
class Api


    def self.get_thesaurus_by_word(word)
        url = "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/#{word}?key=299e3474-8d57-473c-836c-9e5c31d32f6e"
        response = HTTParty.get(url)
        main_hash = response[0] 
        
        if response.empty? #if the api does not return any results, it's not a real word
            return false
        elsif main_hash["meta"] == nil #if api response does not have a meta , it means they couldn't determine what the word was.
            return false
        elsif main_hash["meta"]["id"] == nil #if api response has a meta hash but no id key, it means they couldn't determine what the word was.
            return false
        elsif main_hash["meta"]["id"].to_s != "#{word}" #if api returns a different word than the one requested
            return false
        end

        name_hash = { } 
        name_hash[:name] = main_hash["meta"]["id"]
        name_hash[:word] = word

        if main_hash["def"][0]["sseq"][0][0][1].flatten.include?("rel_list")
            rel_words = []
            main_hash["def"][0]["sseq"][0][0][1]["rel_list"].each do |array| 
                array.each{|hash| hash.each {|key,value| rel_words << "#{value}"}}
            end
            name_hash[:related_words] =  rel_words.join(", ")
        else 
            name_hash[:related_words] = "We're sorry! We couldn't find any related words."
        end

        if main_hash["meta"].flatten.include?("syns")
            syn_words = []
            main_hash["meta"]["syns"].each do |array|
                array.each{|word| syn_words << word}
            end
            name_hash[:syns] = syn_words.join(", ")
        else
            name_hash[:syns] = "We're sorry! We couldn't find any synonyms."
        end

        if main_hash["meta"].flatten.include?("ants")
            ant_words = []
            main_hash["meta"]["ants"].each do |word| #
            ant_words << word
            end
            name_hash[:ants] = ant_words.join(", ")
        else
            name_hash[:ants] = "We're sorry! We couldn't find any antonyms."
        end

        if main_hash.flatten.include?("shortdef")
            name_hash[:short_def] = main_hash["shortdef"][0]
        else
            name_hash[:short_def] = "We're sorry! We couldn't find any definitions."
        end

        
        Word.new(name_hash)
    end

end


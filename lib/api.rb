require "pry"
class Api
    #  Key (Thesaurus): 299e3474-8d57-473c-836c-9e5c31d32f6e

# Key (Dictionary): 85a434fc-3a5d-48df-a8e0-35b0c5bd54ee


#url_interpolated = https://www.dictionaryapi.com/api/v3/references/thesaurus/json/#{word}?key=299e3474-8d57-473c-836c-9e5c31d32f6e
    
    def self.get_thesaurus_by_word(word)
        url = "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/#{word}?key=299e3474-8d57-473c-836c-9e5c31d32f6e"
        response = HTTParty.get(url)
        main_hash = response[0] 
        
        name_hash = {name: main_hash["meta"]["id"], syns: main_hash["meta"]["syns"], ants: main_hash["meta"]["ants"], related_words: main_hash["def"][0]["sseq"][0][0][1]["rel_list"], short_def: main_hash["shortdef"][0] }
        Word.new(name_hash)
    end



end
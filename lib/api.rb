class Api
    #  Key (Thesaurus): 299e3474-8d57-473c-836c-9e5c31d32f6e

# Key (Dictionary): 85a434fc-3a5d-48df-a8e0-35b0c5bd54ee

url = "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/umpire?key=299e3474-8d57-473c-836c-9e5c31d32f6e"
#url_interpolated = https://www.dictionaryapi.com/api/v3/references/thesaurus/json/#{word}?key=299e3474-8d57-473c-836c-9e5c31d32f6e
    
def self.get_thesaurus_by_word
    reponse = HTTParty.get(url)
    end



end
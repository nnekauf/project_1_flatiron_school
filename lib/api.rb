require "pry"
class Api
    #  Key (Thesaurus): 299e3474-8d57-473c-836c-9e5c31d32f6e

# Key (Dictionary): 85a434fc-3a5d-48df-a8e0-35b0c5bd54ee



    
    def self.get_thesaurus_by_word(word)
        url = "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/#{word}?key=299e3474-8d57-473c-836c-9e5c31d32f6e"
        response = HTTParty.get(url)
        main_hash = response[0] 

        rel_words = []
        main_hash["def"][0]["sseq"][0][0][1]["rel_list"].each do |array| 
            array.each{|hash| hash.each {|key,value| rel_words << "#{value}"}}
        end
        
        syn_words = []
        main_hash["meta"]["syns"].each do |array|
            array.each{|word| syn_words << word}
        end

        ant_words = []
        main_hash["meta"]["ants"][0].each do |word|
         ant_words << word
        end
        
        name_hash = {name: main_hash["meta"]["id"], syns: syn_words.join(", "),
        ants: ant_words.join(", "),
        related_words: rel_words.join(", "), 
        short_def: main_hash["shortdef"][0] 
        }
        binding.pry
        Word.new(name_hash)
    end
    
    

end
# def valid_word?
    #      #     4. CHECK FOR VALIDITY. 
    #      #@word =~ /(\d|\s)/  #the word is valid if it does not include spaces or a number
    #                               #the word is valid if the regex does not return nil
    #                                 #the word is valid if the thesarus does not return an empty array
    # end
#if valid_word?
            
        # else
        #     puts "I'm sorry! It seems as though you have not entered a valid word."
        #     puts "Make sure you have spelled it correctly, are only entering one word, and do not include any numbers!"
        # end

        #new word has to equal the name property in the hash in either upper or lowercase form, for examply hi.
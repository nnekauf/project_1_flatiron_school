class Cli
    
    def introduction
   
        puts "  Welcome to What's the Word? CLI App!"
        puts "  Looking for a specific word? Need to spice up your vocabulary? Look no further, our thesaurus will do the trick!"
        self.main_menu
    end

    def main_menu

        puts "MAIN MENU"
        puts "  You're thinking of a word... any word...."
        puts "  Make sure it's ONE word and spelled properly or else you'll bump into an error!"
        puts "  What's the Word? Enter it below."
        self.get_word
    end

    def get_word
        word = gets.strip
        new_word = Api.get_thesaurus_by_word(word)
        #binding.pry
    end

    def return_word_info
        #if valid_word?
            puts "this will be where the thesarus will return info on this word: #{@word}."
        # else
        #     puts "I'm sorry! It seems as though you have not entered a valid word."
        #     puts "Make sure you have spelled it correctly, are only entering one word, and do not include any numbers!"
        # end
    end

    # def valid_word?
    #      #     4. CHECK FOR VALIDITY. 
    #      #@word =~ /(\d|\s)/  #the word is valid if it does not include spaces or a number
    #                               #the word is valid if the regex does not return nil
    #                                 #the word is valid if the thesarus does not return an empty array
    # end

    
    
    
    
   

end
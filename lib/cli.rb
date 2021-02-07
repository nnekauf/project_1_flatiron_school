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
        self.word_options(new_word)
    end

    def word_options(new_word)
        puts "You chose '#{new_word.name.upcase}'! What would you like to know about it?"
        puts "  For Synonyms of '#{new_word.name.upcase}', enter the number '1' "
        puts "  For Antonyms of '#{new_word.name.upcase}', enter the number '2' "
        puts "  For Words Related to '#{new_word.name.upcase}', enter the number '3' "
        puts "  For a Short Definition of '#{new_word.name.upcase}', enter the number '4' "
        self.get_number
    end

    def get_number
        number = gets.strip
        self.return_word_attributes
    end

    def return_word_attributes

    end
    

    
    
    
    
   

end
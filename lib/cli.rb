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
        self.return_word_attributes(new_word)
    end

    # def get_number
    #     number = gets.strip
    #     self.return_word_attributes(number)
    # end

    def return_word_attributes(new_word)
        number = gets.strip
        case number
        when "1"
            puts "Symonyms of '#{new_word.name.upcase}' include '#{new_word.syns}'"
        when "2"
            puts "Antonyms of '#{new_word.name.upcase}' include '#{new_word.ants}'"
        when "3"
            puts "Words Related to '#{new_word.name.upcase}' include '#{new_word.related_words}'"
        when "4"
            puts " A Short Definition of '#{new_word.name.upcase}' is '#{new_word.short_def}'"
        else
            puts "Uh Oh! That selection was invalid!"
            self.word_options(new_word)
        end  
        self.continue(new_word)
    end

    def continue(new_word)
        puts "To know more about the word '#{new_word.name.upcase}', enter the number '1'."
        puts "To choose a new word, enter the number '2'"
        puts "To start from the beginning, enter the number '3'"
        puts "To EXIT this amazing application, type '4'"

        input = gets.strip
        self.continue_choice(input, new_word)
    end

    def continue_choice(input)
        case input
        when "1"
            self.word_options(new_word)
        when "2"
            self.main_menu
        when "3"
            self.introduction
        when "4"
            self.exit
        end  
    end
    
    def exit
        puts "Thank you for using What's the Word Cli App!"
    end
    
    
    
    
   

end
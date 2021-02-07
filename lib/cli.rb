class Cli
    
    # def initialize
        
    # end

    def introduction
   
        puts "  Welcome to What's the Word? CLI App!"
        puts "  Looking for a specific word? Need to spice up your vocabulary? Look no further, our thesaurus will do the trick!"
        self.main_menu
    end

    def main_menu
#     2. USER WILL BE TOLD WHAT THEY HAVE AVAILABLE TO SEE:
#     3. USER WILL BE ASKED TO GIVE BORO IN ORDER TO GET MORE SPECIFIED DATA: 
#         to get started please select a borough from these options (type options) by typing its name below. 
#(will have to account for case sensitivity, make sure respone and option equak eachother in downcase
        puts "MAIN MENU"
        puts "  You're thinking of a word... any word...."
        puts "  Make sure it's ONE word and spelled properly or else you'll bump into an error!"
        puts "  What's the Word? Enter it below."
        @word = gets.strip
        new_word = Api.get_thesaurus_by_word(@word)
        #binding.pry
        #  #may need to seperate in its own method
        # self.return_word_info #will need to move this for seperation of duties
    end

    def valid_word?
         #     4. CHECK FOR VALIDITY. 
         #@word =~ /(\d|\s)/  #the word is valid if it does not include spaces or a number
                                  #the word is valid if the regex does not return nil
                                    #the word is valid if the thesarus does not return an empty array
    end

    def return_word_info
        #if valid_word?
            puts "this will be where the thesarus will return info on this word: #{@word}."
        # else
        #     puts "I'm sorry! It seems as though you have not entered a valid word."
        #     puts "Make sure you have spelled it correctly, are only entering one word, and do not include any numbers!"
        # end
    end

    
    
    
   
    #     5. IF INPUT IS VALID, WILL ASK USER TO CHOOSE MONTH BTWN JAN - JULY
    #     6. WE GET USER INPUT AND CHECK FOR VALIDITY.
    #     7. RETURN DIFFERENT SHOOTING INCIDENCES WITHIN BORO AND MONTH CHOSEN
    #         will show  DATE AND TIME, SUSPECT INFO: AGE, SEX, RACE(MAYBE), VICTIM INFO: AGE, SEX, RACE(MAYBE), IF THE VICTIM DIED
    #     8. THEY SHOULD HAVE THE OPTION TO GO TO MAIN MENU
    #     8. ALL USER INPUTS SHOULD BE VALID
    #     9. THEY SHOULD HAVE THE OPTION TO EXIT THE APP WHEN THEY WANT
    #     10. MAKE SURE IM STORING THE DATA SO I DONT HAVE TO DO IDENTICAL API REQUESTS
end
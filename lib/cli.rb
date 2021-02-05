class Cli

    def introduction
   # 1. USER WILL BE WELCOMED: who we are, what we do, let them know we have info from 1st semester of 2020      
        puts "INTRODUCTION"
        puts "  Welcome to Shooting Crimes CLI Application."
        puts "  We provide information on shootings documented by the NYPD that occured in New York City within the first semester of 2020."
        puts "  Though this information is subject to your own discretion and interpretation, we hope this application reveals patterns within the data that helps citizens of NYC become more vigilant while also inspiring safer communities."
        self.main_menu
    end

    def main_menu
#     2. USER WILL BE TOLD WHAT THEY HAVE AVAILABLE TO SEE:
#     3. USER WILL BE ASKED TO GIVE BORO IN ORDER TO GET MORE SPECIFIED DATA: 
#         to get started please select a borough from these options (type options) by typing its name below. 
#(will have to account for case sensitivity, make sure respone and option equak eachother in downcase
        puts "MAIN MENU"
        puts "  To access information on Shootings that occured within NYC during the first semester of 2020, please select a Borough from the options below."
        puts "  OPTIONS:[ BRONX | BROOKLYN | MANHATTAN | QUEENS | STATEN ISLAND ]"
        puts "  Please type the name of any borough to continue."
        input = gets.strip
    end



    
    
    
    #     4. WE GET USER INPUT AND CHECK FOR VALIDITY. 
    #     5. IF INPUT IS VALID, WILL ASK USER TO CHOOSE MONTH BTWN JAN - JULY
    #     6. WE GET USER INPUT AND CHECK FOR VALIDITY.
    #     7. RETURN DIFFERENT SHOOTING INCIDENCES WITHIN BORO AND MONTH CHOSEN
    #         will show  DATE AND TIME, SUSPECT INFO: AGE, SEX, RACE(MAYBE), VICTIM INFO: AGE, SEX, RACE(MAYBE), IF THE VICTIM DIED
    #     8. THEY SHOULD HAVE THE OPTION TO GO TO MAIN MENU
    #     8. ALL USER INPUTS SHOULD BE VALID
    #     9. THEY SHOULD HAVE THE OPTION TO EXIT THE APP WHEN THEY WANT
    #     10. MAKE SURE IM STORING THE DATA SO I DONT HAVE TO DO IDENTICAL API REQUESTS
end
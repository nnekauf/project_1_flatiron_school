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
#     def valid_rel_list?
#         @main_hash["def"][0]["sseq"][0][0][1].flatten.include?("rel_list")
#     end

#     def valid_syns?
#         @main_hash["meta"].flatten.include?("syns")
#     end

#     def valid_ants?
#         @main_hash["meta"].flatten.include?("ants")
#     end

#     def valid_shortdef?
#         @main_hash.flatten.include?("shortdef")
#     end

#     def assign_attributes
#         name_hash = {name: @main_hash["meta"]["id"]}

#         if self.valid_rel_list?
#             rel_words = []
#             @main_hash["def"][0]["sseq"][0][0][1]["rel_list"].each do |array| 
#                 array.each{|hash| hash.each {|key,value| rel_words << "#{value}"}}
#             end
#             name_hash = {related_words: rel_words.join(", ")}
#         else 
#             name_hash = {related_words: "We're sorry! We couldn't find any related words."}
#         end

#         if self.valid_syns?
#             syn_words = []
#             @main_hash["meta"]["syns"].each do |array|
#                 array.each{|word| syn_words << word}
#             end
#             name_hash = { syns: syn_words.join(", ")}
#         else
#             name_hash = {syns: "We're sorry! We couldn't find any synonyms."}
#         end

#         if self.valid_ants?
#             ant_words = []
#             @main_hash["meta"]["ants"].each do |word| #
#             ant_words << word
#             end
#             name_hash = {ants: ant_words.join(", ")}
#         else
#             name_hash = {ants: "We're sorry! We couldn't find any antonyms."}
#         end

#         if self.valid_shortdef?
#             name_hash = {short_def: @main_hash["shortdef"][0]}
#         else
#             name_hash = {short_def: "We're sorry! We couldn't find any definitions."}
#         end

#         Word.new(name_hash)
#     end
    
   

# end
#################
#if valid_word?
            
        # else
        #     puts "I'm sorry! It seems as though you have not entered a valid word."
        #     puts "Make sure you have spelled it correctly, are only entering one word, and do not include any numbers!"
        # end

        #new word has to equal the name property in the hash in either upper or lowercase form, for examply hi.


        # if !main_hash["def"][0]["sseq"][0][0][1].flatten.include?("rel_list") 
        #     name_hash = {related_words: "We're sorry! We couldn't find any related words."}
        # elsif !main_hash["meta"].flatten.include?("syns")  #if the api response does not include the words rel_list, syns, ants, or shortdef...
        #     name_hash = {syns: "We're sorry! We couldn't find any synonyms."}                                      #...I know that the word requested does not have that specific attriubute that wasn't included
        # elsif !main_hash["meta"].flatten.include?("ants")   #since that word doesnt have either a syn,ant,rel_word,or short_def, I would have to set that attribute to "none"...
        #     name_hash = {ants: "We're sorry! We couldn't find any antonyms."}                                       #... but still be able to return the attributes that do exist.
                                                                                                        
        # elsif !main_hash.flatten.include?("shortdef")
        #     name_hash = {short_def: "We're sorry! We couldn't find any definitions."}
        # else
        #     rel_words = []
        #     main_hash["def"][0]["sseq"][0][0][1]["rel_list"].each do |array| 
        #         array.each{|hash| hash.each {|key,value| rel_words << "#{value}"}}
        #     end
        
        # syn_words = []
        #     main_hash["meta"]["syns"].each do |array|
        #         array.each{|word| syn_words << word}
        #     end

        # ant_words = []
        #     main_hash["meta"]["ants"].each do |word| #
        #     ant_words << word
        #     end

        # name_hash = {name: main_hash["meta"]["id"], syns: syn_words.join(", "),
        # ants: ant_words.join(", "),
        # related_words: rel_words.join(", "), 
        # short_def: main_hash["shortdef"][0] 
        # } 

array = []
def this_method
    array << "first"
        if "happy" != "y"
            array << "no"
        else
            array << "happy"
        end

        if "soup" == "g"
            array << "way"
        else
            array << "days"
        end
        array
    end
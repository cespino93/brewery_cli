class BreweryCli::CLI

    def call
        puts ""
        puts "        ________________________________       "
        puts ""
        puts "      * * * Welcome To Brewery Search * * *    "
        puts "        ________________________________       "
        puts ""
        puts "    Enter - 'menu' to choose from a list of Breweries   "
        puts "    Enter - 'phone' to access their Phone Numbers       "
        puts "                 Exit, to quit                          "
        API.get_data
        menu
    end

    
    
    def menu
        input = gets.strip.downcase
        
        if input == "menu"
            list
            menu
        elsif input == "phone"
            phone_number
            list
        elsif input == "exit"
            puts "Goodbye, Enjoy!"
        else
            try_again
        end
    end


    
    
    def list
        Brewery.all.each_with_index do |breweries, index|
            puts "#{index + 1}. #{breweries.name}"
        end
        input = gets.strip.downcase
        brewery_selection(input)
        puts ""
        puts ""
        puts "~~~~ Please enter 'menu' to return to list of Breweries ~~~~"
        puts "~~~~ OR enter 'phone' to see a list of phone numbers ~~~~"
    end

    def try_again
        puts "Invalid entry, try again"
        menu
    end

    def phone_number
        Brewery.all.each do |name|
        puts "#{name.name} - #{name.phone}l" 
        end
        input = gets.strip.downcase
        brewery_selection(input)
    end

    def brewery_selection(name)
        brewery_lists = Brewery.find_by_name(name)
        brewery_lists.each do |s|
            puts "city: #{s.city}"
            puts "state: #{s.state}"
        end
    end
        
end


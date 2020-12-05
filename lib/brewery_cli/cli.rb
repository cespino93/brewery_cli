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
            puts"#{index + 1}. #{breweries.name}"
        end
        input = gets.strip.downcase
        number_selection(input)
        puts ""
        puts ""
        puts "~~~ Please enter ' menu' to return to list of Breweries ~~~~"
        puts "~~~ OR enter 'phone' to see a list of phone number ~~~~"
    end

    def  try_again
         puts "Invalid entry, try again"
         menu
    end

    def phone_number
        Brewery.all.each do |name|
        puts "#{name.name} - #{name.phone}" 
        end
        input = gets.strip.downcase
        puts ""
        puts ""
        puts "~~~ 'exit' brings you back to the menu, once in menu, enter exit... to exit~~~"
        puts ""
        puts ""
        brewery_selection(input)
    end

    def number_selection(numero)
        brewery_lists = Brewery.find_by_name(numero) || (numero.to_i != 0 && Brewery.all[numero.to_i - 1])
        if brewery_lists 
        brewery_selection(brewery_lists)
        else 
        try_again
        end
    end
    
    def brewery_selection(name)
        puts "state: #{name.state}"
        puts "city:  #{name.city}"
    end
end



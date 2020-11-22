class API

    def self.get_data 
        response = RestClient.get("https://api.openbrewerydb.org/breweries")
        brewery = JSON.parse(response.body)
        
        brewery.each do |brewery|
            Brewery.new(brewery)
        end
    end
end
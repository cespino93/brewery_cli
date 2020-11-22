class Brewery
    attr_accessor :name, :state, :city, :phone
    @@all = []


    def initialize(hash) #Initializing using mass assignments
        hash.each do |k, v|
            self.send(("#{k}="), v) if self.respond_to?("#{k}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_phone(fone)
        self.all.select do |brewery|
            brewery.phone.downcase == fone
        end
    end

    def self.find_by_name(nombre)
        self.all.select do |brewery|
            brewery.name.downcase == nombre
        end
    end

end


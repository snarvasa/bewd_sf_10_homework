#Sean Narvasa // HW 7 // Real Estate

require_relative 'lib/building.rb'
require_relative 'lib/apartment'
require_relative 'lib/renter'

require 'pry'

def create_building
  puts "Please enter the building name. \n"
  building_name = gets.strip #Empty variable set equal to user input
  puts "Please enter the building address \n"
  building_address = gets.strip #Empty variable set equal to user input
  building = Building.new( building_name, building_address) #New variable set equal to a new instance of building,
  #which passes in a user's input as the required arguments
  add_unit_to_building(building) #passing in the new instance of building to run the method below.
end

def add_unit_to_building(building) #Method that adds to building.apartments array and then lists the units within the building.
  puts "How many units? \n"
  units = gets.strip.to_i #'Units' variable set equal to user input, which is transformed into an integer.
  units.times do #loops through however many times are passed to the units variable
    building.apartments << create_apartment #Create_apartment method is used to add
    # x amount of apartments to the building.apartments array, depending on how many times are specified by the user.
    end
    building.list_units #Whatever argument is passed is then having the 'list-units' method called.
    apartments = building.apartments #sets empty 'apartments' variable equal to the apartments array
    find_renter(apartments) #Calls method to loop through apartments array.
  end

def find_renter(apartments) #loops through apartments array in an instance of buildiing
  apartments.each do |apartment| #iterate through each apt
    if apartment.not_occupied? #Calls on the instance method defined in the apartment class
       puts "Apartment #{apartment.number} is vacant and available to rent."
       apartment.renter = create_renter #Assigns empty 'renter' attribute equal to
       #'create_renter', to create a renter for the apartment if it is vacant
       puts apartment.renter #Prints the renter based on the redefined 'to_s' method in the apartment class.
    else puts apartment.renter #Same as above line.
    end
  end
end



def create_renter
  puts "Please enter the renter's name.\n"
  name = gets.strip
  puts "What is #{name}'s salary \n"
  salary = gets.strip
  puts "What's #{name}'s credit score? \n"
  credit_score = gets.strip
  Renter.new( name, salary, credit_score) #Creates a new instance of Renter class, with user inputs as passed arguments
end

def create_apartment
  puts "Please enter the apt. # \n"
  apt = gets.strip
  puts "How many square feet? \n"
  sfeet = gets.strip
  puts "Cool. How many bedrooms? \n"
  bedrooms = gets.strip
  puts "Bathrooms? \n"
  bathrooms = gets.strip
  Apartment.new( apt, sfeet, bedrooms, bathrooms) #Creates a new instance of Argument class, with user inputs as passed arguments
end


create_building

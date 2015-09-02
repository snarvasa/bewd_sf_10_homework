#Sean Narvasa // HW 7 // Real Estate

require 'pry'
require 'pry-byebug'

class Building

  attr_accessor :name, :address, :apartments
  #Getter & setter method for attributes associated to instances of the class

  def initialize(name, address)
    #Since apartments is going to be an array of instances of apartments,
    #it is not required as an argument
    #Creates instances of the class, requiring 5 attributes as arguments
    @name = name
    @address = address
    @apartments = [] #an empty array since there will be a collection of apartments within our building.
  end

  def to_s #Any instance of 'Building' now will print the following as oopposed to just the object id if 'puts' is called.
    "#{name} at #{address} has #{apartments.count} apartments"
  end

  def list_units #new instance method that lists the units for each instance of building.
    puts "There are #{apartments.count} units in #{name}."
    apartments.each do |apartment| #loops through each apartment in the array and prints info on it.
      puts "Unit #{apartment.number} has #{apartment.bedrooms} bedrooms & #{apartment.bathrooms} bathrooms."
    end
  end

end

#Sean Narvasa // HW 7 // Real Estate
require 'pry'

class Renter

  attr_accessor :name, :salary, :credit_score

  def initialize(name, salary, credit_score)
    @name = name
    @salary = salary
    @credit_score = credit_score
  end

  def to_s
    "#{name} is renting the apartment with a #{credit_score} credit score and a salary of #{salary}."
  end

end

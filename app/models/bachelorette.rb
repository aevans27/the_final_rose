class Bachelorette < ApplicationRecord
  has_many :contestants
  
  def average_contestant_age
    contestants.average(:age).round
  end

  def unique_towns
    town_string = ""
    contestants.distinct.pluck(:hometown).each_with_index do |element, index|
      if index == 0
        town_string += "#{element}"
      else
        town_string += ", #{element}"
      end
    end
    town_string
  end
end

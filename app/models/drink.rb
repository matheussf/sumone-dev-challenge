# frozen_string_literal: true

class Drink < ApplicationRecord
  validates :name, :description, :image_url, presence: true
  validates :rating_avg, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :alcohol_level, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # Bitterness level
  validates :ibu, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  paginates_per 10
  default_scope -> { order('name') }

  enum temperature: %i[
    hot
    warm
    ambient
    cold
    extra_cold
  ]
  
  enum base_ingredient: %i[
    cachaca
    gin
    rum
    sake
    tequila
    vodka
    whiskey
    wine
    liqueur
    beer
  ]
  
  def self.search(search_word)
    if search_word
      Drink.where("lower(name) LIKE '#{search_word.downcase}%'").page(1)
    else
      nil
    end
  end
  
  # This method will rate the user preferences to bring the
  # 5 best possible Drinks for him.
  def self.user_recommendation(alcoholLevel, distilled, temperature, base_ingredient)
    if distilled.nil?
      distilled = rand(2)
    end
    
    alcoholLevel    = alcoholLevel.to_i || rand(61)
    temperature     = Drink.temperatures[temperature.to_s.downcase] || rand(6)
    
    alcoholLevelRange = 14
    
    minimumAlcoholLevel = alcoholLevel - alcoholLevelRange || 0
    maximumAlcoholLevel = alcoholLevel + alcoholLevelRange || 60
    
    minimumTemperature = temperature - 2 || 0
    maximumTemperature = temperature + 3 || 0
    
    @drinks = Drink.where(:alcohol_level => minimumAlcoholLevel...maximumAlcoholLevel, 
                          :distilled => distilled, 
                          :temperature => minimumTemperature...maximumTemperature, 
                          :base_ingredient => (base_ingredient.blank? ? 0...10 : base_ingredient))
                          .limit(3).page(1)
    
    # Caso o algoritmo não encontre um drink adequado ao usuário
    if @drinks.first.nil?
      @drinks = Drink.all.order("RANDOM()").limit(3).page(1)
    end
    
    return @drinks
  end
  
end

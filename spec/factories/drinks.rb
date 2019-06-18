# frozen_string_literal: true

FactoryBot.define do
  factory :drink do
    name 'Americano'
    image_url 'https://example.com/image.jpg'
    description 'A drink that has a lot of water'
    rating_avg 1
    alcohol_level 1
    ibu 1
    temperature :hot
  end
end

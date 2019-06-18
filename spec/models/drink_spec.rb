# frozen_string_literal: true

require 'rails_helper'

describe Drink do
  describe 'validations' do
    subject { drink }

    let(:drink) { FactoryBot.build :drink }

    it { expect { drink.name = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.description = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.image_url = nil }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.rating_avg = 6 }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.alcohol_level = -1 }.to change { drink.valid? }.from(true).to(false) }
    it { expect { drink.ibu = 11 }.to change { drink.valid? }.from(true).to(false) }
    
  end
  
  describe 'methods' do
    before (:each) do
      drink = FactoryBot.build :drink
      drink.save!
    end
    
    it "should bring the correct search drink" do
        expect(Drink.search("Americano").first.name).to eq("Americano")
    end
    
    it "shouldn't bring any drink at all" do
      @drink = Drink.search("Fail").first
      expect(@drink).to eq(nil)
    end
    
    it "should recommend me some drink" do
      expect(Drink.user_recommendation(nil, nil, nil, nil).first.name).to eq("Americano")
    end
    
  end
end

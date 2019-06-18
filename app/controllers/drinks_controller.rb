# frozen_string_literal: true

class DrinksController < ApplicationController
  def index
    @drink = Drink.new
    if cookies[:user].blank?
      flash[:notice] = "Tell me your preferences, so I can recommend you better!<br>Do it by pressing the button on the left :)"
    end
    @drinks = Drink.page(params[:page])
  end
  
  def search
    respond_to do |format|
      @drinks = Drink.search(params[:search])
      format.js { render 'index.js.erb' }
    end
  end
  
  def recommend
    respond_to do |format|
      @drinks = Drink.page(params[:page])
      if cookies[:user].blank?
        flash[:notice] = "Tell me your preferences, so I can recommend you better!<br>Do it by pressing the button on the left :)"
      end
      
      @drinks = Drink.user_recommendation(cookies[:alcohol], cookies[:distilled], cookies[:temperature], cookies[:base_ingredient])
      format.js { render 'index.js.erb' }
    end
  end
end


class UsersController < ApplicationController
  before_action :set_user, only: [:update_user_preferences]
  
	def update_user_preferences
    respond_to do |format|
			if cookies[:user].present?
				flash[:notice] = "Your preferences has been updated."
				format.html { redirect_to root_path, notice: 'Your preferences has been updated' }
      	format.json { redirect_to root_path, notice: 'Your preferences has been updated' }
			else
				flash[:error] = "Something happened while trying to update your preferences."
				format.html { redirect_to root_path }
      	format.json { render json: @user.errors, status: :unprocessable_entity }
			end
			
		end
	end
	
  private
  def set_user
		cookies[:user] = { :value => "User has preferences." }
		cookies[:alcohol] = { :value => params[:drink][:alcoholLevel] }
		cookies[:distilled] = { :value => params[:drink][:distilled] }
		cookies[:temperature] = { :value => params[:drink][:temperature] }
		cookies[:base_ingredient] = { :value => params[:drink][:base_ingredient] }
  end

  def drink_params
    params.require(:drink).permit(:alcoholLevel, :distilled, :temperature, :base_ingredient)
  end
end

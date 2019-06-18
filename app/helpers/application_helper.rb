# frozen_string_literal: true

module ApplicationHelper
	def alerts
		alert = (flash[:alert] || flash[:error] || flash[:notice])
		
		if alert
			alert_generator alert
		end
	end
	
	def alert_generator msg
		js add_gritter(msg, :title => "Notification", sticky: false, time: 5000, :position => :bottom_left)
	end
end

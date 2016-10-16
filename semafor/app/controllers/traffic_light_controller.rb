class TrafficLightController < ActionController::Base
	
	def changecolorto
		session[:color] = params[:color]	
		redirect_to "/showtrafficlight"
	end
end

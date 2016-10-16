Rails.application.routes.draw do
	get '/showtrafficlight' => 'traffic_light#showtrafficlight'

	post '/changecolorto/:color' => 'traffic_light#changecolorto'
end

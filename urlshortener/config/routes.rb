Rails.application.routes.draw do
  get '/shortened' => 'urls#shortened'
	get '/url_result' => 'urls#url_result'
	get ':id' => 'urls#goto'

	post '/do_shorten' => 'urls#do_shorten'
end

Rails.application.routes.draw do
  get '/shortened' => 'urls#shortened'
	get '/url_result' => 'urls#url_result'
	get '/:id' => 'urls#redirect'

	post '/do_shorten' => 'urls#do_shorten'
end

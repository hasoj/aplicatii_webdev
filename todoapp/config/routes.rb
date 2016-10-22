Rails.application.routes.draw do

  get '/todo' => 'to_do_app#todo'
	get '/showeditformfor/:id' => 'to_do_app#showeditformfor'
  post '/withitem/:id' => 'to_do_app#withitem_do'
  post '/buttonsatbottom' => 'to_do_app#buttonsatbottom'
	post '/savechangesfor/:id' => 'to_do_app#savechangesfor'
	post 'doaddnewitem' => 'to_do_app#doaddnewitem'

end

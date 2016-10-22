Rails.application.routes.draw do
 get '/cart' => 'shopping_cart#cart'
 

 post '/addnewproduct' => 'shopping_cart#addnewproduct'
 post '/addtoshoppingcart/:product_id' => 'shopping_cart#addtoshoppingcart'
end

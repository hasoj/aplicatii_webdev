class ShoppingCartController < ActionController::Base
  @@p = Rails.configuration.products
  @@s = Rails.configuration.shopping_cart_items
  
  def p_save(p_item)
    @@p.save(p_item)
    @@p.client.indices.flush :index => :products
  end

  def s_save(s_item)
    @@s.save(s_item)
    @@s.client.indices.flush :index => :shopping_cart_items
  end

  def cart
    @products = @@p.search('*').to_a.map(&:to_hash)
    @sci = @@s.search('*').to_a.map(&:to_hash)
    @scitotal = @sci.reduce(0) { |total, item| total += item['acquisition_price'] * item['quantity'].to_i }
  end

  def addnewproduct
    
    item = {id: SecureRandom.hex, description: params[:description], price: params[:price]}    
    p_save(item)    
  
    redirect_to '/cart'
  end
  
# id
# product_id
# acquisition_price
# quantity
  def addtoshoppingcart
    sitem = @@p.find(params[:product_id]).to_hash
    item = {id: SecureRandom.hex, product_id: params[:product_id], acquisition_price: sitem['price'], quantity: params[:quantity], description: sitem['description']} 
    s_save(item) 
    redirect_to '/cart'
  end

end

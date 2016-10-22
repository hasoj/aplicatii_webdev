require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ShoppingCart
  class Application < Rails::Application
    config.products = Elasticsearch::Persistence::Repository.new do
      client Elasticsearch::Client.new url: 'http://localhost:9200', log: true
      index :products
      type  :data_record
    end

    config.products.create_index! force: true

    config.shopping_cart_items = Elasticsearch::Persistence::Repository.new do
      client Elasticsearch::Client.new url: 'http://localhost:9200', log: true
      index :shopping_cart_items
      type  :data_record
    end

# id
# product_id
# acquisition_price
# quantity

    config.shopping_cart_items.create_index! force: true

    config.products.save(
      { id: SecureRandom.hex, price: 34, description: 'Printer paper (10-ream case)' }
    )
    config.products.save(
      { id: SecureRandom.hex, price:  7, description: 'Stapler' }
    )
    config.products.save(
      { id: SecureRandom.hex, price:  6, description: 'Box of 100 paper clips' }
    )
    config.products.save(
      { id: SecureRandom.hex, price: 24, description: 'Toner cartridge' }
    )
    config.products.save(
      { id: SecureRandom.hex, price:  6, description: 'USB stick 8GB' }
    )
    config.products.save(
      { id: SecureRandom.hex, price: 11, description: 'USB stick 16GB' }
    )
    config.products.save(
      { id: SecureRandom.hex, price:  5, description: 'Box of 60 ball point pens' }
    )
  end
end

class DataRecord
  attr_reader :attributes

  def initialize(attributes={})
    @attributes = attributes
  end

  def to_hash
    @attributes
  end
end

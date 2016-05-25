require 'open-uri'
require 'json'

class ProductCreator

  def initialize(upc_code)
     if url_and_json_data_status(upc_code) == 1
        @product = Product.new(allowed_params(upc_code))
     end
  end

  def ok?
     save_product
  end

  def url_and_json_data_status(upc_code)

     upc_code.slice!(".json")
     upc_url = File.join('http://world.openfoodfacts.org/api/v0/product',upc_code.concat(".json"))

     begin
        data = open(upc_url).read
     rescue
        @url_status = 0
        return 0
     end

     obj = JSON.parse(data) 
     if obj["status"] == 0
        @url_status = 2
        return 2
     end
    
     @url_status = 1
     return 1

  end

  private

  def save_product
     @product.save if (!duplicate_upc && @url_status == 1)
  end

  def duplicate_upc
     return true if (Product.where(upc_code: @upccode).count >= 1)
     false
  end

  def allowed_params(upc_code)

     @upccode = upc_code

     upc_code.slice!(".json")
     upc_url = File.join('http://world.openfoodfacts.org/api/v0/product',upc_code.concat(".json"))

     data = open(upc_url).read

     obj = JSON.parse(data)

     product = obj['product']

     name = product['product_name']

     image = product['image_small_url']

     quantity = product['quantity']

     brands = product['brands']

     categories = product['categories']

     ingredients = product['ingredients_text']

     {name: name, image: image, quantity: quantity, brands: brands, categories: categories, ingredients: ingredients, upc_code: upc_code}
  end

end

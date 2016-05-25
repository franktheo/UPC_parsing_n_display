class ProductsController < ApplicationController

   def index
     @products = Product.all
   end

   def new
     @product = Product.new
   end

  def show
    @product = Product.find(params[:id])
  end

  def create
 
     upc_codes = product_params[:upc_code]

     @upc = upc_codes.split(" ")
     @duplicate_upcs = []

     @upc.each do |upc_code|
        action = ProductCreator.new(upc_code)
     
        if action.ok?
           flash[:product] = "Product created"
        elsif action.url_and_json_data_status(upc_code) == 0
           flash[:product] = "URL site is down or incorrect. Please verify."
        elsif action.url_and_json_data_status(upc_code) == 2
           upc_code.slice!(".json")
           flash[:product] = "UPC code is not valid. Please enter a valid one."
        else
           upc_code.slice!(".json")
           @duplicate_upcs << upc_code
           flash[:product] = "Duplicate UPC - #{upc_code.inspect}. Please enter another UPC Code."
        end  
     end
     unless @duplicate_upcs.empty?
        flash[:product] = "Duplicate UPC(s) - #{@duplicate_upcs}. Please enter valid UPC Codes."
     end
     redirect_to new_product_path
  end

  #def edit
  #  @product = Product.find(params[:id])
  #end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_url, :notice => 'Product destroyed'
  end

  private
    def product_params
      params.require(:product).permit(:name, :image, :quantity, :brands, :categories, :ingredients, :upc_code)
    end

end

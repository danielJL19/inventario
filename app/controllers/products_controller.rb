class ProductsController < ApplicationController
  before_action :product_find, only: %i[show edit stock change_stock update]
  def index
    @products = Product.select(:id,:name, :description, :serial_number, :unit_cost, :sale_price, :category_id, :amount, :provider_id, :created_at)
    respond_to do |format|
      format.html 
      format.csv {send_data @products.to_csv, filename: "products-#{Date.today}.csv"}
    end
  end

  def new 
    @product = Product.new
  end

  def create 
    @product = Product.new(product_params)
    
    respond_to do |format|
      if @product.save
        format.turbo_stream{ render turbo_stream: turbo_stream.prepend('products', partial: "products/product", locals: {product: @product})}
      else
        render :new, status: :unprocessable_entity
      end
    end

    
  end

  def show 

  end

  def stock
    @movement = Movement.new
    
  end

  def update
    if @product.update(product_params)
      render turbo_stream
    else

    end
  end

  def change_stock

    @movement = @product.movements.new(movement_params)
    
    if @movement.save
      
      redirect_to products_path, notice: "Se ha actualizado el stock de manera exitosa"  
    else
      render :stock, status: :unprocessable_entity
    end
    
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :serial_number, :unit_cost, :sale_price, :category_id, :amount, :provider_id)
  end

  def product_find
    @product = Product.find(params[:id])
  end
  
  def movement_params
    params.require(:movement).permit(:type_movement,:amount, :reason)
  end
end

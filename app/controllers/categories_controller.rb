class CategoriesController < ApplicationController
  before_action :category_find, only: %i[edit update destroy]

  def index
    @categories = Category.all
  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save # true or false => true significa que se guardo correctamente a la bd // false => significa que hubo errores (validaciones)
      redirect_to categories_path, notice: "Se ha guardado exitosamente" 
    else
      render :new, status: :unprocessable_entity # volver a renderizar nuestro formulario con los respectivos errores
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.turbo_stream {render turbo_stream: turbo_stream.remove(@category)}
      format.html {redirect_to categories_path, notice: "Se ha eliminado con éxito"}
    end
  end

  def edit
    
  end

  def update
    if @category.update(category_params)
      flash[:notice]= "Se ha actualizado con éxito"
      redirect_to categories_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def category_find
    @category = Category.find(params[:id])
  end
end 

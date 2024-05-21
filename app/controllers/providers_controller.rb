class ProvidersController < ApplicationController
  def index
    @providers = Provider.select(:name, :phone, :address) 
  end

  def new
    @provider = Provider.new 
  
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to providers_path, notice:'Se ha creado con éxito'
    else
      render :new, status: :unprocessable_entity
    end
  end 
  
  def update

  end

  def destroy

  end

  private 

  def provider_params
    params.require(:provider).permit(:name, :address, :phone)
  end

  def provider_find
    @provider = Provider.find(params[:id])
  end
end 

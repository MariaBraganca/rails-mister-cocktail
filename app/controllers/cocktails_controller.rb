class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    if params[:query].present?
      @cocktails = Cocktail.search_by_name(params[:query])
    elsif params[:search_category]
      @cocktails = Cocktail.where(category: params[:search_category][:category])
    elsif params[:search_alcoholic]
      @cocktails = Cocktail.where(alcoholic: params[:search_alcoholic][:alcoholic])
    elsif params[:search_glass]
      @cocktails = Cocktail.where(glass: params[:search_glass][:glass])
    else
      @cocktails = Cocktail.all
    end
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end

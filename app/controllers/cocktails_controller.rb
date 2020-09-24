class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    if params[:query].present?
      @term = params[:query]
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

    new()
  end

  def show
    @dose = Dose.new
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

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :instruction, :category, :alcoholic, :glass)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end

class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    if params[:query].present?
      # @cocktails = Cocktail.where(name: params[:query])
      # LIKE, search for matching string, case sensitive
      # ILIKE, search for matching string, case insensitive
      # @@ full text, search for multiple terms
      # @cocktails = Cocktail.where("name @@ :query", query: "%#{params[:query]}%")
      @cocktails = Cocktail.search_by_name(params[:query])
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

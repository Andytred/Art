class ArtworksController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        artworks.address @@ :query \
      "
      @artworks = Artwork.where(sql_query, query: "%#{params[:query]}%")
    else
      @artworks = Artwork.all
    end
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    if @artwork.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    @transaction = Transaction.new
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :price_per_hour, :photo)
  end
end

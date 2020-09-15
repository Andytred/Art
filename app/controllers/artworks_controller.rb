class ArtworksController < ApplicationController
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

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :price_per_hour, :photo)
  end
end

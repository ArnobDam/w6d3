class ArtworksController < ApplicationController

    def index
        render json: Artwork.all
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork, status: :created
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: Artwork.find(params[:id])
    end

    def update
        
    end

    def destroy
        destroyed_artwork = Artwork.find(params[:id])
        # Artwork.find(params[:id]).destroy
        destroyed_artwork.destroy
        render json: destroyed_artwork
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
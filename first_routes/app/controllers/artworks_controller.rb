class ArtworksController < ApplicationController

    def index
        # render json: Artwork.all
        user_id = params[:artist_id]
        render json: User.find(user_id).artworks
        render json: User.find(user_id).shared_artworks



        # render json: Artwork.find(params[:artist_id])
        # render json: Artwork.find(params[:artist_id]).all
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork, status: :created
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    # def show
    #     render json: Artwork.find(params[:id])
    # end

    def update
        # find associated artwork
        artwork = Artwork.find(params[:id])

        artwork.update(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
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

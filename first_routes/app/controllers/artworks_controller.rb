class ArtworksController < ApplicationController

    def index
        # artworks_hash = {}
        # if params.has_key?(:id)
        #     artworks_hash[:artworks] = User.find_by(:id).artworks
        #     artworks_hash[:shared_artworks] = User.find_by(:id).shared_artworks
        # else
            # artworks_hash[:artworks] = Artwork.all
        # end

        # artworks_hash[:artworks] = Artwork.where(artist_id: params[:users.id])
        # artworks_hash[:shared_artworks] = Artwork.where(artist_id: params[:users.id])
        render json: Artwork.artworks_for_user_id(params[:user_id])
        # user_id = params[:artist_id]
        # artworks_hash = {}
        # artworks_hash[:artworks] = User.find_by(user_id).artworks
        # artworks_hash[:shared_artworks] = User.find_by(user_id).shared_artworks
        # render json: User.find(user_id).artworks
        # render json: User.find(user_id).shared_artworks



        # render json: artworks_hash
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

        # user_id = params[:artist_id]
        # artworks_hash = {}
        # artworks_hash[:artworks] = User.find_by(user_id).artworks
        # artworks_hash[:shared_artworks] = User.find_by(user_id).shared_artworks

        # render json: artworks_hash
    end

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

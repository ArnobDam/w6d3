# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true
    validates :artist_id, presence: true
    # validates [:artist_id, :title], uniqueness: true

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        inverse_of: :artwork,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    def self.artworks_for_user_id(user_id)
        # artworks_hash = {}
        # artworks_hash[:artworks] = User.find(user_id).artworks
        # artworks_hash[:shared_artworks] = User.find(user_id).shared_artworks
        artworks_arr = []
        artworks_arr << User.find(user_id).artworks
        artworks_arr << User.find(user_id).shared_artworks
    end
end

class Car < ApplicationRecord
  include PgSearch::Model

  has_many :bookings, dependent: :destroy
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # has_many_attached :photos
  pg_search_scope :search_by_brand_and_description,
    against: [ :brand, :description ],
    using: {
      tsearch: { prefix: true }
    }
end

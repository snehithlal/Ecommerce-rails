class Product < ApplicationRecord
    has_one :stock, dependent: :destroy,inverse_of: :product 
    has_one :category, through: :stock
    validates :price, presence: true
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    mount_uploader :image, ImageUploader

    accepts_nested_attributes_for :stock, reject_if: :all_blank, allow_destroy: true
    default_scope { order(:name) }
end

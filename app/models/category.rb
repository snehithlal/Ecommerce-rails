class Category < ApplicationRecord
    has_many :stocks
    has_many :products, through: :stocks, dependent: :destroy
    validates :name, presence: true
    validates_uniqueness_of :name, on: :create, message: "name must be unique"

    default_scope { order(:name) }

end

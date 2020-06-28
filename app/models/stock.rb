class Stock < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :product, optional: true
    validates :count, presence: true


    accepts_nested_attributes_for :product, reject_if: :all_blank, allow_destroy: true
end

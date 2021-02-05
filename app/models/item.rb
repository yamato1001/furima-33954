class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :concept
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :image
  end
  with_options numericality:{other_than: 1} do
    validates :category_id 
    validates :product_condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

end

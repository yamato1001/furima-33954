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
    validates :category_id
    validates :product_condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
    validates :image
  end

  

end

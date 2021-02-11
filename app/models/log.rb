class Log < ApplicationRecord
  has_one :shipping

  belongs_to :user, optional: true
  belongs_to :item, optional: true
  
end

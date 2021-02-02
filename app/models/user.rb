class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :first_name_kana, :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name, :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :birthday
  end   
      
end

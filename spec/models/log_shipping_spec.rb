require 'rails_helper'

RSpec.describe LogShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @log_shipping = FactoryBot.build(:log_shipping, user_id: @user.id , item_id: @item.id)
      sleep(1)
  end

  context '登録がうまくいくとき' do
    it "全ての値が入力されていれば保存ができること" do
      expect(@log_shipping).to be_valid
    end

    it "building_name以外の全ての値が入力されていれば保存ができること" do
      @log_shipping.building_name = nil
      expect(@log_shipping).to be_valid
    end
  end

  context '登録がうまくいかないとき' do
    it "tokenが空では登録できないこと" do
      @log_shipping.token = nil
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeが空では登録できないこと" do
      @log_shipping.postal_code = nil
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
      @log_shipping.postal_code = '1234567'
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "prefecture_idが--では登録できないこと" do
      @log_shipping.prefecture_id = 1
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "municipalityが空では登録できないこと" do
      @log_shipping.municipality = nil
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Municipality can't be blank")
    end

    it "addressが空では登録できないこと" do
      @log_shipping.address = nil
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      @log_shipping.phone_number = nil
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが全角数字では登録できないこと" do
      @log_shipping.phone_number = '０９０１２３４５６７８'
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが英数混合では登録できないこと" do
      @log_shipping.phone_number = 'o9o12345678'
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが11文字以内ではないと登録できないこと" do
      @log_shipping.phone_number = '090123456789'
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Phone number is invalid")
    end

    it "user_idが空だと登録できない" do
      @log_shipping.user_id = nil
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空だと登録できない" do
      @log_shipping.item_id = nil
      @log_shipping.valid?
      expect(@log_shipping.errors.full_messages).to include("Item can't be blank")
    end

  end
end



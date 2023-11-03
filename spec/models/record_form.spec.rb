require 'rails_helper'

RSpec.describe RecordForm, type: :model do
  before do
    @record_form = FactoryBot.build(:record_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @record_form.user_id = 1
        expect(@record_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @record_form.item_id = 1
        expect(@record_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @record_form.postal_code = '123-4560'
        expect(@record_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @record_form.prefecture_id = 1
        expect(@record_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @record_form.city = '横浜市'
        expect(@record_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @record_form.house_number = '旭区１２３'
        expect(@record_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @record_form.building_name = nil
        expect(@record_form).to be_valid
      end
      it '電話番号が11桁以内かつハイフンなしであれば保存できる' do
        @record_form.telephone = '12345678910'
        expect(@record_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @record_form.user_id = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @record_form.item_id = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @record_form.postal_code = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @record_form.postal_code = '1234567'
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が「---」だと保存できないこと' do
        @record_form.prefecture_id = 0
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '都道府県が空だと保存できないこと' do
        @record_form.prefecture_id = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Prefecture is not a number")
      end
      it '市区町村が空だと保存できないこと' do
        @record_form.city = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @record_form.house_number = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @record_form.telephone = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @record_form.telephone = '123-1234-1234'
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @record_form.telephone = '12345678910123111'
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include('Telephone is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @record_form.token = nil
        @record_form.valid?
        expect(@record_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

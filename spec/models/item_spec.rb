require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
 
    # 1. 全てのカラムが入力されている時に登録できること
    it 'is valid with a all_column' do
      @item.valid?
      expect(@item).to be_valid
    end

    # 2. nameが空では登録できないこと
    it 'is invalid without a name' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("を入力してください")
    end

    # 3. urlが空では登録できないこと
    it 'is invalid without a url' do
      @item.url = nil
      @item.valid?
      expect(@item.errors[:url]).to include("を入力してください")
    end

    # 4. codeが空では登録できないこと
    it 'is invalid without a code' do
      @item.code = nil
      @item.valid?
      expect(@item.errors[:code]).to include("を入力してください")
    end

    # 5. descriptionが空では登録できないこと
    it 'is invalid without a description' do
      @item.description = nil
      @item.valid?
      expect(@item.errors[:description]).to include("を入力してください")
    end

    
  end
end

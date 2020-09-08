require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
 
    # 1. 全てのカラムが入力されている時に登録できること
    it 'is valid with a all_column' do
      @user.valid?
      expect(@user).to be_valid
    end

    # 2. emailが空では登録できないこと
    it 'is invalid without a email' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("が入力されていません。")
    end

    # 3. 重複したemailが存在する場合登録できないこと
    it 'is invalid with a duplicate email address' do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.valid?
      expect(@another_user.errors[:email]).to include("は既に使用されています。")
    end

    # 4. passwordが空では登録できないこと
    it 'is invalid without a password' do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("が入力されていません。", "は有効でありません。")
    end

    # 5. passwordが存在してもpasswrd_confirmationが空では登録できないこと
    it 'is invalid without a password_confirmation although with a password' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6. passwordが数字だけだと登録できないこと
    it 'is invalid if password is only numbers ' do
      @user.password, password_confirmation = '123456'
      @user.valid?
      expect(@user.errors[:password]).to include("は有効でありません。")
    end

    # 7. passwordが英語だけだと登録できないこと
    it 'is invalid if password is only english ' do
      @user.password, password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:password]).to include("は有効でありません。")
    end

    # 8. passwordが数字と英語両方使うと登録できること
    it 'is You can register if password uses both numbers and English ' do
      @user.password, password_confirmation = 's1111111'
      expect(@user).to be_valid
    end

    # 9. passwordが8文字以上であれば登録できること
    it 'is valid with a password that has more than 8 characters ' do
      @user.password, password_confirmation = 's1111111'
      expect(@user).to be_valid
    end

    # 10. passwordが7文字以下であれば登録できないこと
    it 'is invalid with a password that has less than 7 characters ' do
      @user.password, password_confirmation = '00000aa'
      @user.valid?
      expect(@user.errors[:password]).to include("は有効でありません。")
    end

    # 11. nameが空では登録できないこと
    it 'is invalid without a name' do
      @user.name = nil
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    # 12. emailに@マークが含まれていない場合登録できないこと
    it 'is invalid cannot register if email does not contain @ mark ' do
      @user.email = 'aaabbbcccddd'
      @user.valid?
      expect(@user.errors[:email]).to include("は有効でありません。")
    end
  end
end

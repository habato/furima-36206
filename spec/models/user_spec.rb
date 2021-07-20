require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '必要な情報を適切に入力すれば登録できること' do
    expect(@user).to be_valid
  end

  it 'nicknameが空では登録できないこと' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空では登録できないこと' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'passwordが空では登録できないこと' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'last_nameが空では登録できないこと' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it 'first_nameが空では登録できないこと' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'last_name_kanaが空では登録できないこと' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end

  it 'first_name_kanaが空では登録できないこと' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it 'birthdayが空では登録できないこと' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it 'passwordが6文字以上かつ英数字混合であれば登録できること' do
    @user.password = 'a1a1a1'
    @user.password_confirmation = 'a1a1a1'
    expect(@user).to be_valid
  end

  it 'passwordが5文字以下であれば登録できないこと' do
    @user.password = 'a1a1a'
    @user.password_confirmation = 'a1a1a'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'passwordが6文字以上でも英数字混合でなければ登録できないこと' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end

  it 'passwordとpassword_confirmationが不一致では登録できないこと' do
    @user.password = 'a1a1a1'
    @user.password_confirmation = 'b2b2b2'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'passwordが全角のみだと登録できない' do
    @user.password = 'ああああああ'
    @user.password_confirmation = 'ああああああ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end

  it 'passwordが半角数字のみだと登録できない' do
    @user.password = '111111'
    @user.password_confirmation = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end

  it '重複したemailが存在する場合登録できないこと' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'emailは@を含む必要があること' do
    @user.email = 'testtest'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.last_name = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
  end

  it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.first_name = 'taro'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
  end

  it 'last_name_kanaは全角（カタカナ）での入力が必須であること' do
    @user.last_name_kana = '山田'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
  end

  it 'first_name_kanaが空では登録できないこと' do
    @user.first_name_kana = '太郎'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "名前、メール、パスワードがあれば有効な状態であること" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  
  it "名前がなければ無効な状態であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
  
  it "名前が50文字以下ならば有効な状態であると" do
    user = FactoryBot.build(:user, name: "A"*50)
    expect(user).to be_valid
  end
  it "名前が51文字以上ならば無効な状態であること" do
    user = FactoryBot.build(:user, name: "A"*51)
    user.valid?
    expect(user.errors[:name]).to include("は50文字以内で入力してください")
   end
  
  it "メールアドレスがなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  
  it "パスワードがなければ無効な状態であること" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
  
  it "パスワードが6文字以上であれば有効な状態であること" do
    user = FactoryBot.build(:user, password: "123456", password_confirmation: "123456")
    user.valid?
  end
  
  it "パスワードが5文字以下なら無効な状態であること" do
    user = FactoryBot.build(:user, password: "12345", password_confirmation: "12345")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end
  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:user)
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
  
  it "パスワードとパスワード（確認用）が一致しなければ無効な状態であること" do
    user = FactoryBot.build(:user, password_confirmation: "keyword")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end
  
end

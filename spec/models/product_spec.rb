require 'rails_helper'

RSpec.describe Product, type: :model do
   before do
    @product = FactoryBot.build(:product)
  end
  it "食材名、期限、外部キーがあれば有効な状態であること" do
    expect(@product).to be_valid
  end
  it "食材名がなければ無効な状態であること" do
    @product.name = nil
    @product.valid?
    expect(@product.errors[:name]).to include("を入力してください")
  end
  it "食材名が20文字以下ならば有効な状態であること" do
    @product.name = "A"*20
    expect(@product).to be_valid
  end
  it "食材名が21文字以上ならば無効な状態であること" do
    @product.name = "A"*21
    @product.valid?
    expect(@product.errors[:name]).to include("は20文字以内で入力してください")
  end
  it "期限がなければ無効な状態であること" do
    @product.deadline = nil
    @product.valid?
    expect(@product.errors[:deadline]).to include("を入力してください")
  end
  it "期限が今日以降のものなら有効な状態であること" do
    @product.deadline = Date.tomorrow
    expect(@product).to be_valid
  end
  it "期限が今日以前のものならば無効な状態であること" do
    @product.deadline = Date.yesterday
    @product.valid?
    expect(@product.errors[:deadline]).to include("は今日以降のものを選択してください")
  end
  
end

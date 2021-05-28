class Product < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :deadline, presence: true
  validate :date_before_start


  def date_before_start
    errors.add(:deadline, "は今日以降のものを選択してください") if deadline.nil? || deadline < Date.today
  end
end

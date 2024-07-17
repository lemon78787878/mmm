class Food < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quantity


  with_options presence: true do
    validates :food_name
    validates :stock
    validates :deadline
  end

  with_options presence: true, numericality: { other_than: 1, message: '必ずを選択してください' } do
    validates :category_id
    validates :quantity_id
  end

  belongs_to :user
  has_one_attached :image
end

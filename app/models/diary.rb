class Diary < ApplicationRecord
  with_options presence: true do
    validates :diary_day
    validates :dish
  end

  belongs_to :user
  has_one_attached :image
end

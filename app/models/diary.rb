class Diary < ApplicationRecord
  with_options presence: true do
    validates :day
    validates :dish
  end

  belongs_to :user
end
